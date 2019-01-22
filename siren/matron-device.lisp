(in-package :siren)

(defvar *devices* '())

;; TODO: move this into matron code?
(defclass matron-device ()
  ((dev-ptr :initarg :dev-ptr :reader dev-ptr-of)))

(defmethod dev-type-of ((device matron-device))
  (cffi:foreign-slot-value (dev-ptr-of device)
						   '(:struct matron:dev-common-t)
						   'matron::type))

(defmethod id-of ((device matron-device))
  (cffi:foreign-slot-value (dev-ptr-of device)
						   '(:struct matron:dev-common-t)
						   'matron::id))

(defmethod name-of ((device matron-device))
  (cffi:foreign-slot-value (dev-ptr-of device)
						   '(:struct matron:dev-common-t)
						   'matron::name))

(defmethod serial-of ((device matron-device))
  (cffi:foreign-slot-value (dev-ptr-of device)
						   '(:struct matron:dev-common-t)
						   'matron::serial))

;;;
;;; device registration; should this be made generic for all matron-devices?
;;;
(defun register-device (device)
  (pushnew device *devices* :key #'id-of))

(defmethod deregister-device ((device-id fixnum))
  (setf *devices* (delete-if #'(lambda (d) (eq (id-of d) device-id))
				  *devices*)))

(defmethod deregister-device ((device matron-device))
  (deregister-matron-device (id-of device)))
