(in-package :matron)

(defctype size :unsigned-int) ; MAINT: confirm against size_t

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

(defcstruct engine-command
  (name :string)
  (format :string))

(defcstruct engine-poll
  (name :string)
  (type poll-type-t))

(defcstruct engine-param
  (name :string)
  (bus-idx :int))

;;;
;;; osc types
;;;
(defctype osc-message :pointer)

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
	 (common (:pointer (:struct event-common)))
	 ,@body))

(defcstruct event-common
  (type :uint32)
  (free free-event-data-t))

(%defevent event-exec-code-line
  (line :string))

(%defevent event-monome-add
  (dev :pointer))

(%defevent event-monome-remove
  (id :uint32))

(%defevent event-grid-key
  (id :uint8)
  (x :uint8)
  (y :uint8)
  (state :uint8))

(%defevent event-arc-encoder-delta
  (id :uint8)
  (number :uint8)
  (delta :int8))

(%defevent event-arc-encoder-key
  (id :uint8)
  (number :uint8)
  (state :int8))

(%defevent event-hid-add
  (dev :pointer))

(%defevent event-hid-remove
  (id :uint32))

(%defevent event-hid-event
  (id :uint8)
  (type :uint8)
  (code :uint16)
  (value :int32))

(%defevent event-midi-add
  (dev :pointer))

(%defevent event-midi-remove
  (id :uint32))

(%defevent event-midi-event
  (id :uint32)
  (data :uint8 :count 3)
  (nbytes size))

(%defevent event-osc
  (path :string)
  (from-host :string)
  (from-port :string)
  (msg osc-message))

(%defevent event-metro
  (id :uint32)
  (stage :uint32))

(%defevent event-key
  (id :uint8)
  (val :uint8))

(%defevent event-battery
  (percent :uint8)
  (current :int16))

(%defevent event-power
  (present :uint8))

(%defevent event-stat
  (disk :uint16)
  (temp :uint8)
  (cpu :uint8))

(%defevent event-enc
  (n :uint8)
  (delta :int8))

(%defevent event-poll-value
  (idx :uint32)
  (value :float))

(%defevent event-poll-io-levels
  (idx :uint32)
  (value (:union quad-levels-t)))

(%defevent event-poll-data
  (idx :uint32)
  (size :uint32)
  (data (:pointer :uint8)))

(%defevent event-poll-wave
  (idx :uint32)
  (data (:pointer :uint8)))

(%defevent event-startup-ready-ok)
(%defevent event-startup-ready-timeout)

(defcunion event-data
  (type :uint32)
  (common (:struct event-common))
  (exec-code-line (:struct event-exec-code-line))
  (monome-add (:struct event-monome-add))
  (monome-remove (:struct event-monome-remove))
  (grid-key (:struct event-grid-key))
  (arc-encoder-delta (:struct event-arc-encoder-delta))
  (arc-encoder-key (:struct event-arc-encoder-key))
  (hid-add (:struct event-hid-add))
  (hid-remove (:struct event-hid-remove))
  (hid-event (:struct event-hid-event))
  (midi-add (:struct event-midi-add))
  (midi-remove (:struct event-midi-remove))
  (midi-event (:struct event-midi-event))
  (osc-event (:struct event-osc))
  (key (:struct event-key))
  (enc (:struct event-enc))
  (battery (:struct event-battery))
  (power (:struct event-power))
  (stat (:struct event-stat))
  (metro (:struct event-metro))
  (poll-value (:struct event-poll-value))
  (poll-data (:struct event-poll-data))
  (poll-io-levels (:struct event-poll-io-levels))
  (poll-wave (:struct event-poll-wave))
  (startup-ready-ok (:struct event-startup-ready-ok))
  (startup-ready-timeout (:struct event-startup-ready-timeout)))

;;;
;;; event api
;;;

(defctype event-data-ptr (:pointer (:union event-data)))

;; signals the event_loop to stop
(defcvar ("quit" *quit*) :bool)

(defconstant +event-wave-display-bytes+ 128)

(defcfun "events_init" :void)
(defcfun "event_set_handler" :void (h event-handler-t))
(defcfun "event_loop" :void)
(defcfun "event_data_new" event-data-ptr
  (evcode event-t)
  (cb free-event-data-t))
(defcfun "event_data_free" :void
  (ev event-data-ptr))
(defcfun "event_post" :void
  (ev event-data-ptr))

