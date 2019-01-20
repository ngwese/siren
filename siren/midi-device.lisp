(in-package :siren)

(defvar *midi-devices* '())

(defclass midi-device ()
  ((id :initarg :id :reader id-of)
   (name :initarg :name :reader name-of)))

(defun register-midi-device (device)
  (pushnew device *midi-devices* :key #'id-of))

(defgeneric deregister-midi-device (device))

(defmethod deregister-midi-device ((device-id fixnum))
  (setf *midi-devices* (delete-if #'(lambda (d) (eq (id-of d) device-id))
								  *midi-devices*)))

(defmethod deregister-midi-device ((device midi-device))
  (deregister-midi-device (id-of device)))
