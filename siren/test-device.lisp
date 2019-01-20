(in-package :siren-user)

(defvar *midi-devices* '())

(cffi:defcallback demo-handler :void ((ev event-data-ptr-t))
  (let* ((type-num (cffi:foreign-slot-value ev '(:union event-data-t) 'type))
		 (type (cffi:foreign-enum-keyword 'event-t type-num)))
	(case type
	  (:event-key
	   (cffi:with-foreign-slots ((matron::id matron::val) ev (:struct event-key-t))
	  	 (screen-clear)
		 (screen-level 15)
		 (screen-move 10d0 10d0)
		 (screen-text (format nil "id: ~D val: ~D" matron::id matron::val))
		 (screen-update)
		 ))
	  (:event-enc
	   (cffi:with-foreign-slots ((matron::n matron::delta) ev (:struct event-enc-t))
	  	 (screen-clear)
		 (screen-level 15)
		 (screen-move 10d0 20d0)
		 (screen-text (format nil "n: ~D delta: ~D" matron::n matron::delta))
		 (screen-update)))
	  (:event-midi-event
	   (cffi:with-foreign-slots ((matron::id matron::data matron::nbytes) ev (:struct event-midi-event-t))
		 (handle-event-midi-event matron::id matron::data matron::nbytes)))
	  (:event-midi-add
	   (cffi:with-foreign-slots ((matron::dev) ev (:struct event-midi-add-t))
		 (handle-event-midi-add matron::dev)))
	  (:event-midi-remove
	   (cffi:with-foreign-slots ((matron::id) ev (:struct event-midi-remove-t))
		 (handle-event-midi-remove matron::id)))
	  (:event-hid-event
	   (cffi:with-foreign-slots ((matron::id matron::type matron::code matron::value)
								 ev (:struct event-hid-event-t))
		 (handle-event-hid-event matron::id matron::type matron::code matron::value)))
	  (:event-hid-add
	   (handle-event-hid-add (cffi:foreign-slot-value ev '(:struct event-hid-add-t)
													  'matron::dev)))
	  (:event-hid-remove
	   (handle-event-hid-remove (cffi:foreign-slot-value ev '(:struct event-hid-remove-t)
														 'matron::id)))
	  (otherwise
	   (format t "=> no match? ~A ~A~%" (type-of type) (type-of :event-type-key))
	   ))
	(event-data-free ev)))

;;;
;;; hid
;;;

(defun handle-event-hid-add (dev-ptr)
  (format t "hid add: ~A~%" dev-ptr))

(defun handle-event-hid-remove (dev-id)
  (format t "hid remove: ~D~%" dev-id))

(defun handle-event-hid-event (id type code value)
  (format t "hid event: id=~D type=~D code=0x~X value=~D~%" id type code value))


;;;
;;; midi
;;;

(defun handle-event-midi-add (dev-ptr)
  (cffi:with-foreign-slots ((matron::id matron::name) dev-ptr (:struct dev-common-t))
	(let ((device (make-instance 'siren::midi-device :id matron::id :name matron::name)))
	  (siren::register-midi-device device)
	  (format t "midi add: id=~D name=~A // ~A~%" matron::id matron::name siren::*midi-devices*)
)))

(defun handle-event-midi-remove (dev-id)
  (siren::deregister-midi-device dev-id)
  (format t "midi remove: ~D // ~A~%" dev-id siren::*midi-devices*))

(defun handle-event-midi-event (dev-id data num-bytes)
  (format t "midi event: ~D ~A ~D~%" dev-id data num-bytes))



;;;
;;;
;;;

(defun test-device-init ()
  (events-init)  ;; must come first
  (event-set-handler (cffi:callback demo-handler))
  (screen-init)

  (metros-init)
  (gpio-init)    ; for keys
  (i2c-init)     ; for enc

  (dev-list-init)
  (dev-monitor-init))

(defun test-device-deinit ()
  (dev-monitor-deinit)
  (i2c-deinit)
  (gpio-deinit)
  (screen-deinit))
