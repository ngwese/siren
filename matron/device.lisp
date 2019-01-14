(in-package :matron)

(defctype ssize :int) ; MAINT: confirm against ssize_t

;;;
;;; device common
;;;

(defcenum device-t
  :dev-type-monome
  :dev-type-hid
  :dev-type-midi
  :dev-type-count
  :dev-type-invalid)

(defctype dev-start :pointer)
(defctype dev-deinit :pointer)

(defctype pthread-t :uint32) ; FIXME: this needs to be confirmed or dev-common is possibly wrong

(defcstruct dev-common
  (type device-t)
  (id :uint32)
  (tid pthread-t)
  (path :string)
  (serial :string)
  (name :string)
  (start dev-start)
  (deinit dev-deinit))

;;;
;;; device monome
;;;

(defcenum device-monome-type-t
  :device-monome-type-grid
  :device-monome-type-arc)

; TODO: monome-t
(defctype monome-t :void)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +monome-buffer-size+ 256))

(defcstruct dev-monome
  (dev (:struct dev-common))
  (type device-monome-type-t)
  (m (:pointer monome-t))
  (data :uint8 :count 256) ; led data by quad
  (dirty :bool :count 4))

(defctype dev-monome-ptr (:pointer (:struct dev-monome)))

(defcfun "dev_monome_grid_set_led" :void
  (md dev-monome-ptr)
  (x :uint8)
  (y :uint8)
  (val :uint8))

(defcfun "dev_monome_arc_set_led" :void
  (md dev-monome-ptr)
  (x :uint8)
  (y :uint8)
  (val :uint8))

(defcfun "dev_monome_all_led" :void
  (md dev-monome-ptr)
  (val :uint8))

(defcfun "dev_monome_set_quad" :void
  (md dev-monome-ptr)
  (quad :uint8)
  (data (:pointer :uint8)))

(defcfun "dev_monome_refresh" :void (md dev-monome-ptr))
(defcfun "dev_monome_grid_rows" :int (md dev-monome-ptr))
(defcfun "dev_monome_grid_cols" :int (md dev-monome-ptr))

(defcfun "dev_monome_set_rotation" :void
  (md dev-monome-ptr)
  (val :uint8))

(defctype %monome-self-ptr (:pointer :void))

(defcfun "dev_monome_init" :int (self %monome-self-ptr))
(defcfun "dev_monome_deinit" :void (self %monome-self-ptr))
(defcfun "dev_monome_start" :void (self %monome-self-ptr))

;;;
;;; device hid
;;;

(defctype dev-vid-t :uint8)
(defctype dev-pid-t :uint8)
(defctype dev-code-t :uint16)

(defctype libevdev :void)

(defcstruct dev-hid
  (base (:struct dev-common))
  (dev (:pointer libevdev))
  (vid dev-vid-t)
  (pid dev-pid-t)
  (num-types :int)
  (types (:pointer :uint8))
  (num-codes (:pointer :int))
  (codes (:pointer (:pointer dev-code-t))))

(defctype %hid-self-ptr (:pointer :void))

(defcfun "dev_hid_init" :int (self %hid-self-ptr) (print :bool))
(defcfun "dev_hid_deinit" :void (self %hid-self-ptr))
(defcfun "dev_hid_start" (:pointer :void) (self %hid-self-ptr))

;;;
;;; device midi
;;;

(defctype snd-rawmidi-t :void)

(defcstruct dev-midi
  (dev (:struct dev-common))
  (handle-in (:pointer snd-rawmidi-t))
  (handle-out (:pointer snd-rawmidi-t)))

(defctype %midi-self-ptr (:pointer :void))

(defcfun "dev_midi_init" :int (self %midi-self-ptr))
(defcfun "dev_midi_deinit" :void (self %midi-self-ptr))
(defcfun "dev_midi_start" (:pointer :void) (self %midi-self-ptr))
(defcfun "dev_midi_send" ssize
  (self %midi-self-ptr)
  (data (:pointer :uint8))
  (n size))

;;;
;;; device
;;;

(defcunion dev
  (base (:struct dev-common))
  (monome (:struct dev-monome))
  (hid (:struct dev-hid))
  (midi (:struct dev-midi)))

(defctype dev-ptr (:pointer (:union dev)))

(defcfun "devices_init" :void)
(defcfun "dev_new" dev-ptr
  (type device-t)
  (path :string)
  (name :string))
(defcfun "dev_delete" :void (d dev-ptr))
(defcfun "dev_id" :int (d dev-ptr))
(defcfun "dev_serial" :string (d dev-ptr))
(defcfun "dev_name" :string (d dev-ptr))

;;;
;;; device list
;;;

(defcfun "dev_list_init" :void)
(defcfun "dev_list_add" :void
  (type device-t)
  (node :string)
  (name :string))
(defcfun "dev_list_remove" :void
  (type device-t)
  (name :string))

;;;
;;; device monitor
;;;

(defcfun "dev_monitor_init" :void)
(defcfun "dev_monitor_deinit" :void)
(defcfun "dev_monitor_scan" :void)

