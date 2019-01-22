(in-package :siren)

;;;
;;; monome-device: common grid/arc behavior
;;;

(defclass monome-device (matron-device) ())

(defmethod monome-ptr-of ((device monome-device))
  (cffi:foreign-slot-value (dev-ptr-of device)
						   '(:struct matron:dev-monome-t)
						   'matron::m))

;; (defmethod led-buffer ((device monome-device))
;;   (cffi:foreign-slot-value (dev-ptr-of device) '(:struct matron:dev-monome-t) 'matron::data))

(defmethod led-refresh ((device monome-device))
  (matron:dev-monome-refresh (dev-ptr-of device)))

(defmethod led-all ((device monome-device) value)
  (matron:dev-monome-all-led (dev-ptr-of device) (clip value 0 15)))

(declaim (inline clip))
(defun clip (x low high) (min (max low x) high))

; FIXME: this should actually error on out of bounds instead of clip
;; (defun buffer-value (buffer index)
;;   (cffi:mem-aref buffer :uint8 (clip index 0 255)))

;; (defun (setf buffer-value) (value buffer index)
;;   (setf (cffi:mem-aref buffer :uint8 (clip index 0 255)) value))


;;;
;;; grid-device
;;;

(defun null-grid-key-handler (x y z))
(defun null-grid-remove-handler (id))

(defclass grid-device (monome-device)
  ((key-handler :initarg :key-handler
		:accessor key-handler-of
		:initform #'null-grid-key-handler)
   (remove-handler :initarg :remove-handler
		   :accessor remove-handler-of
		   :initform #'null-grid-remove-handler)
   (rows :reader rows-of :initform 0)
   (columns :reader columns-of :initform 0)))

(defmethod initialize-instance :after ((device grid-device) &key)
  (with-slots (dev-ptr rows columns) device
    (setf rows (dev-monome-grid-rows dev-ptr))
    (setf columns (dev-monome-grid-cols dev-ptr))))

(defmethod led-set ((device grid-device) x y value)
  (matron:dev-monome-grid-set-led (dev-ptr-of device) x y (clip value 0 15)))

;;;
;;; arc-device
;;;

(defclass arc-device (monome-device)
  ())

;; FIXME: check this; should it be x in 0-3 and y in 0-63?
(defmethod led-set ((device arc-device) x y value)
  (matron:dev-monome-arc-set-led (dev-ptr-of device) x y (clip value 0 15)))
