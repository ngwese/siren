(in-package :siren-user)

;; (cffi:defcallback demo-handler :void ((ev event-data-ptr-t))
;;   (cffi:with-foreign-slots ((type) ev event-data-ptr-t)
;; 	(format t "ev type: ~D~%" type)))

(cffi:defcallback demo-handler :void ((ev event-data-ptr-t))
  (let ((type (cffi:foreign-slot-value ev '(:union event-data-t) 'type)))
	(format t "ev type: ~D~%" type)))

(defun test-screen ()
  (events-init)  ;; must come first
  (event-set-handler (cffi:callback demo-handler))
  
  (gpio-init)    ; for keys
  (i2c-init)     ; for enc

  (event-loop)

  (i2c-deinit)
  (gpio-deinit))
  
  
