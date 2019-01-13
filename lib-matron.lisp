(in-package :siren)

(cffi:define-foreign-library :cairo
  (t (:default "libcairo")))

(cffi:define-foreign-library :freetype
  (t (:default "libfreetype")))

(cffi:define-foreign-library :monome
  (t (:default "libmonome")))

(cffi:define-foreign-library :udev
  (t (:default "libudev")))

(cffi:define-foreign-library :evdev
  (t (:default "libevdev")))

(cffi:define-foreign-library :pthread
  (t (:default "libpthread")))

(cffi:define-foreign-library :matron
  (t (:default "libmatron")))

(pushnew #P"/home/we/norns/build/matron/" cffi:*foreign-library-directories*
	 :test #'equal)

(cffi:use-foreign-library :udev)
(cffi:use-foreign-library :evdev)
(cffi:use-foreign-library :cairo)
(cffi:use-foreign-library :freetype)
(cffi:use-foreign-library :monome)
(cffi:use-foreign-library :matron)
