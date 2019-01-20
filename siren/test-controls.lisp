(in-package :siren-user)

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
	  (otherwise
	   (format t "=> no match? ~A ~A~%" (type-of type) (type-of :event-type-key))
	   ))
	(event-data-free ev)))

(defun test-controls-init ()
  (events-init)  ;; must come first
  (event-set-handler (cffi:callback demo-handler))
  (screen-init)
  (gpio-init)    ; for keys
  (i2c-init))    ; for enc

(defun test-controls-deinit ()
  (i2c-deinit)
  (gpio-deinit)
  (screen-deinit))
  
  
