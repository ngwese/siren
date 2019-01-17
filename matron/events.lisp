(in-package :matron)

(defctype size-t :unsigned-int) ; MAINT: confirm against size_t

;;;
;;; callback types
;;;
(defctype event-handler-t :pointer)
(defctype free-event-data-t :pointer)

;;;
;;; oracle types
;;;

(defcenum poll-type-t
  :poll-type-value
  :poll-type-data)

(defcstruct engine-command-t
  (name :string)
  (format :string))

(defcstruct engine-poll-t
  (name :string)
  (type poll-type-t))

(defcstruct engine-param-t
  (name :string)
  (bus-idx :int))

;;;
;;; osc types
;;;
(defctype osc-message-t :pointer)

;;;
;;; event structures
;;;
(defcenum event-t
  :event-first-event
  :event-exec-code-line
  :event-metro
  :event-key
  :event-enc
  :event-battery
  :event-power
  :event-stat
  :event-monome-add
  :event-monome-remove
  :event-grid-key
  :event-arc-encoder-delta
  :event-arc-encoder-key
  :event-hid-add
  :event-hid-remove
  :event-hid-event
  :event-midi-add
  :event-midi-remove
  :event-midi-event
  :event-osc
  :event-engine-report
  :event-engine-loaded
  :event-poll-value
  :event-poll-data
  :event-poll-wave
  :event-poll-io-levels
  :event-startup-ready-ok
  :event-startup-ready-timeout
  :event-reset-lvm
  :event-quit)

(defcunion quad-levels-t
  (bytes :uint8 :count 4)
  (uint :uint32))

(defmacro %defevent (name &rest body)
  `(defcstruct ,name
	 (common (:struct event-common-t))
	 ,@body))

(defcstruct event-common-t
  (type :uint32)
  (free free-event-data-t))

(%defevent event-exec-code-line-t
  (line :string))

(%defevent event-monome-add-t
  (dev :pointer))

(%defevent event-monome-remove-t
  (id :uint32))

(%defevent event-grid-key-t
  (id :uint8)
  (x :uint8)
  (y :uint8)
  (state :uint8))

(%defevent event-arc-encoder-delta-t
  (id :uint8)
  (number :uint8)
  (delta :int8))

(%defevent event-arc-encoder-key-t
  (id :uint8)
  (number :uint8)
  (state :int8))

(%defevent event-hid-add-t
  (dev :pointer))

(%defevent event-hid-remove-t
  (id :uint32))

(%defevent event-hid-event-t
  (id :uint8)
  (type :uint8)
  (code :uint16)
  (value :int32))

(%defevent event-midi-add-t
  (dev :pointer))

(%defevent event-midi-remove-t
  (id :uint32))

(%defevent event-midi-event-t
  (id :uint32)
  (data :uint8 :count 3)
  (nbytes size-t))

(%defevent event-osc-t
  (path :string)
  (from-host :string)
  (from-port :string)
  (msg osc-message-t))

(%defevent event-metro-t
  (id :uint32)
  (stage :uint32))

(%defevent event-key-t
  (id :uint8)
  (val :uint8))

(%defevent event-battery-t
  (percent :uint8)
  (current :int16))

(%defevent event-power-t
  (present :uint8))

(%defevent event-stat-t
  (disk :uint16)
  (temp :uint8)
  (cpu :uint8))

(%defevent event-enc-t
  (n :uint8)
  (delta :int8))

(%defevent event-poll-value-t
  (idx :uint32)
  (value :float))

(%defevent event-poll-io-levels-t
  (idx :uint32)
  (value (:union quad-levels-t)))

(%defevent event-poll-data-t
  (idx :uint32)
  (size :uint32)
  (data (:pointer :uint8)))

(%defevent event-poll-wave-t
  (idx :uint32)
  (data (:pointer :uint8)))

(%defevent event-startup-ready-ok-t)
(%defevent event-startup-ready-timeout-t)

(defcunion event-data-t
  (type :uint32)
  (common (:struct event-common-t))
  (exec-code-line (:struct event-exec-code-line-t))
  (monome-add (:struct event-monome-add-t))
  (monome-remove (:struct event-monome-remove-t))
  (grid-key (:struct event-grid-key-t))
  (arc-encoder-delta (:struct event-arc-encoder-delta-t))
  (arc-encoder-key (:struct event-arc-encoder-key-t))
  (hid-add (:struct event-hid-add-t))
  (hid-remove (:struct event-hid-remove-t))
  (hid-event (:struct event-hid-event-t))
  (midi-add (:struct event-midi-add-t))
  (midi-remove (:struct event-midi-remove-t))
  (midi-event (:struct event-midi-event-t))
  (osc-event (:struct event-osc-t))
  (key (:struct event-key-t))
  (enc (:struct event-enc-t))
  (battery (:struct event-battery-t))
  (power (:struct event-power-t))
  (stat (:struct event-stat-t))
  (metro (:struct event-metro-t))
  (poll-value (:struct event-poll-value-t))
  (poll-data (:struct event-poll-data-t))
  (poll-io-levels (:struct event-poll-io-levels-t))
  (poll-wave (:struct event-poll-wave-t))
  (startup-ready-ok (:struct event-startup-ready-ok-t))
  (startup-ready-timeout (:struct event-startup-ready-timeout-t)))

;;;
;;; event api
;;;

(defctype event-data-ptr-t (:pointer (:union event-data-t)))

;; signals the event_loop to stop
(defcvar ("quit" *event-loop-quit*) :bool)

(defconstant +event-wave-display-bytes+ 128)

(defcfun "events_init" :void)
(defcfun "event_set_handler" :void (h event-handler-t))
(defcfun "event_loop" :void)
(defcfun "event_data_new" event-data-ptr-t
  (evcode event-t)
  (cb free-event-data-t))
(defcfun "event_data_free" :void
  (ev event-data-ptr-t))
(defcfun "event_post" :void
  (ev event-data-ptr-t))

