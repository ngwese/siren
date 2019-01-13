(in-package :matron)

(define-foreign-library :cairo
  (t (:default "libcairo")))

(define-foreign-library :freetype
  (t (:default "libfreetype")))

(define-foreign-library :monome
  (t (:default "libmonome")))

(define-foreign-library :udev
  (t (:default "libudev")))

(define-foreign-library :evdev
  (t (:default "libevdev")))

(define-foreign-library :pthread
  (t (:default "libpthread")))

(define-foreign-library :matron
  (t (:default "libmatron")))

(pushnew #P"/home/we/norns/build/matron/" cffi:*foreign-library-directories*
	 :test #'equal)

(defun load-libraries ()
  (progn
	(use-foreign-library :udev)
	(use-foreign-library :evdev)
	(use-foreign-library :cairo)
	(use-foreign-library :freetype)
	(use-foreign-library :monome)
	(use-foreign-library :matron)))
