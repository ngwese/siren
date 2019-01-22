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
	  (:event-grid-key
	   (cffi::with-foreign-slots ((matron::id matron::x matron::y matron::state) ev
								  (:struct event-grid-key-t))
		 (handle-event-grid-key matron::id matron::x matron::y matron::state)))
	  (:event-arc-encoder-delta
	   (cffi:with-foreign-slots ((matron::id matron::number matron::delta) ev
								 (:struct event-arc-encoder-delta-t))
		 (handle-event-arc-encoder-delta matron::id matron::number matron::delta)))
	  (:event-arc-encoder-key
	   (cffi:with-foreign-slots ((matron::id matron::number matron::state) ev
								 (:struct event-arc-encoder-key-t))
		 (handle-event-arc-encoder-key matron::id matron::number matron::state)))
	  (:event-monome-add
	   (handle-event-monome-add (cffi:foreign-slot-value ev '(:struct event-monome-add-t)
														 'matron::dev)))
	  (:event-monome-remove
	   (handle-event-monome-remove (cffi:foreign-slot-value ev '(:struct event-monome-remove-t)
															'matron::id)))
	  
	  (otherwise
	   (format t "=> no match? ~A ~A~%" (type-of type) (type-of :event-type-key))
	   ))
	(event-data-free ev)))

;;;
;;; hid
;;;

(defun handle-event-hid-add (dev-ptr)
  (let ((device (make-instance 'siren::hid-device :dev-ptr dev-ptr)))
	(siren::register-device device)
	(format t "hid add: id=~D name=~A // ~A~%" (siren::id-of device) (siren::name-of device) siren::*devices*)))

(defun handle-event-hid-remove (dev-id)
  (siren::deregister-device dev-id)
  (format t "hid remove: ~D // ~A~%" dev-id siren::*devices*))

(defun handle-event-hid-event (id type code value)
  (format t "hid event: id=~D type=~D code=0x~X value=~D~%" id type code value))


;;;
;;; midi
;;;

(defun handle-event-midi-add (dev-ptr)
  (let ((device (make-instance 'siren::midi-device :dev-ptr dev-ptr)))
	(siren::register-device device)
	(format t "midi add: id=~D name=~A // ~A~%" (siren::id-of device) (siren::name-of device) siren::*devices*)))

(defun handle-event-midi-remove (dev-id)
  (siren::deregister-device dev-id)
  (format t "midi remove: ~D // ~A~%" dev-id siren::*devices*))

(defun handle-event-midi-event (dev-id data num-bytes)
  (format t "midi event: ~D ~A ~D~%" dev-id data num-bytes))

;;;
;;; grid/arc
;;;

(defun handle-event-monome-add (dev-ptr)
  (cffi:with-foreign-slots ((matron::type matron::m) dev-ptr (:struct dev-monome-t))
	(case matron::type
	  (:device-monome-type-arc
	   (let ((arc (make-instance 'siren::arc-device :dev-ptr dev-ptr)))
		 (siren::register-device arc)
		 (format t "monome (arc) add: id=~D name=~A // ~A~%" (siren::id-of arc) (siren::name-of arc) siren::*devices*)))
	  (:device-monome-type-grid
	   (let ((grid (make-instance 'siren::grid-device :dev-ptr dev-ptr)))
		 (siren::register-device grid)
		 (format t "monome (grid) add: id=~D name=~A // ~A~%" (siren::id-of grid) (siren::name-of grid) siren::*devices*)))
	  (otherwise
	   (error "unrecognized device type")))))

(defun handle-event-monome-remove (dev-id)
  (siren::deregister-device dev-id)
  (format t "monome remove: ~D // ~A~%" dev-id siren::*devices*))

(defun handle-event-grid-key (id x y state)
  (format t "grid key: ~D ~D ~D ~D~%" id x y state))

(defun handle-event-arc-encoder-delta (id number delta)
  (format t "arc encoder: ~D ~D ~D~%" id number delta))

(defun handle-event-arc-encoder-key (id number state)
  (format t "arc key: ~D ~D ~D~%" id number state))



;;;
;;; test
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
