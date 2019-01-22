(in-package :matron)

(defctype ssize-t :int)				  ; MAINT: confirm against ssize_t

;;;
;;; device common
;;;

(defcenum dev-type-t
  :dev-type-monome
  :dev-type-hid
  :dev-type-midi
  :dev-type-count
  :dev-type-invalid)

(defctype dev-start-t :pointer)
(defctype dev-deinit-t :pointer)

(defctype pthread-t :uint32) ; FIXME: this needs to be confirmed or dev-common-t is possibly wrong

(defcstruct dev-common-t
  (type dev-type-t)
  (id :uint32)
  (tid pthread-t)
  (path :string)
  (serial :string)
  (name :string)
  (start dev-start-t)
  (deinit dev-deinit-t))

;;;
;;; device monome
;;;

(defcenum device-monome-type-t
  :device-monome-type-grid
  :device-monome-type-arc)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defconstant +monome-buffer-size+ 256))

(defcstruct dev-monome-t
  (dev (:struct dev-common-t))
  (type device-monome-type-t)
  (m monome:monome-ptr-t)				; libmonome device pointer
  (data :uint8 :count 256)				; led data by quad
  (dirty :bool :count 4))

(defctype dev-monome-ptr-t (:pointer (:struct dev-monome-t)))

(defcfun "dev_monome_grid_set_led" :void
  (md dev-monome-ptr-t)
  (x :uint8)
  (y :uint8)
  (val :uint8))

(defcfun "dev_monome_arc_set_led" :void
  (md dev-monome-ptr-t)
  (x :uint8)
  (y :uint8)
  (val :uint8))

(defcfun "dev_monome_all_led" :void
  (md dev-monome-ptr-t)
  (val :uint8))

(defcfun "dev_monome_set_quad" :void
  (md dev-monome-ptr-t)
  (quad :uint8)
  (data (:pointer :uint8)))

(defcfun "dev_monome_refresh" :void (md dev-monome-ptr-t))
(defcfun "dev_monome_grid_rows" :int (md dev-monome-ptr-t))
(defcfun "dev_monome_grid_cols" :int (md dev-monome-ptr-t))

(defcfun "dev_monome_set_rotation" :void
  (md dev-monome-ptr-t)
  (val :uint8))

(defctype %monome-self-ptr-t (:pointer :void))

(defcfun "dev_monome_init" :int (self %monome-self-ptr-t))
(defcfun "dev_monome_deinit" :void (self %monome-self-ptr-t))
(defcfun "dev_monome_start" :void (self %monome-self-ptr-t))

;;;
;;; device hid
;;;

(defctype dev-vid-t :uint8)
(defctype dev-pid-t :uint8)
(defctype dev-code-t :uint16)

(defctype libevdev :void)

(defcstruct dev-hid-t
  (base (:struct dev-common-t))
  (dev (:pointer libevdev))
  (vid dev-vid-t)
  (pid dev-pid-t)
  (num-types :int)
  (types (:pointer :uint8))
  (num-codes (:pointer :int))
  (codes (:pointer (:pointer dev-code-t))))

(defctype %hid-self-ptr-t (:pointer :void))

(defcfun "dev_hid_init" :int (self %hid-self-ptr-t) (print :bool))
(defcfun "dev_hid_deinit" :void (self %hid-self-ptr-t))
(defcfun "dev_hid_start" (:pointer :void) (self %hid-self-ptr-t))

;;;
;;; device midi
;;;

(defctype snd-rawmidi-t :void)

(defcstruct dev-midi-t
  (dev (:struct dev-common-t))
  (handle-in (:pointer snd-rawmidi-t))
  (handle-out (:pointer snd-rawmidi-t)))

(defctype %midi-self-ptr-t (:pointer :void))

(defcfun "dev_midi_init" :int (self %midi-self-ptr-t))
(defcfun "dev_midi_deinit" :void (self %midi-self-ptr-t))
(defcfun "dev_midi_start" (:pointer :void) (self %midi-self-ptr-t))
(defcfun "dev_midi_send" ssize-t
  (self %midi-self-ptr-t)
  (data (:pointer :uint8))
  (n size-t))

;;;
;;; device
;;;

(defcunion dev-t
  (base (:struct dev-common-t))
  (monome (:struct dev-monome-t))
  (hid (:struct dev-hid-t))
  (midi (:struct dev-midi-t)))

(defctype dev-ptr-t (:pointer (:union dev-t)))

(defcfun "devices_init" :void)
(defcfun "dev_new" dev-ptr-t
  (type dev-type-t)
  (path :string)
  (name :string))
(defcfun "dev_delete" :void (d dev-ptr-t))
(defcfun "dev_id" :int (d dev-ptr-t))
(defcfun "dev_serial" :string (d dev-ptr-t))
(defcfun "dev_name" :string (d dev-ptr-t))

;;;
;;; device list
;;;

(defcfun "dev_list_init" :void)
(defcfun "dev_list_add" :void
  (type dev-type-t)
  (node :string)
  (name :string))
(defcfun "dev_list_remove" :void
  (type dev-type-t)
  (name :string))

;;;
;;; device monitor
;;;

(defcfun "dev_monitor_init" :void)
(defcfun "dev_monitor_deinit" :void)
(defcfun "dev_monitor_scan" :void)

