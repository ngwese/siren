(in-package :matron)

;;
;; paths
;;

(setf (logical-pathname-translations "norns-src")
	  `(("**;*.*.*" #p"/home/greg/proj/norns/**/*.*")))

(setf (logical-pathname-translations "matron-build")
	  `(("**;*.*.*" "norns-src:build;matron;**;*.*")))

(setf (logical-pathname-translations "matron-src")
	  `(("**;*.*.*" "norns-src:matron;src;**;*.*")))

;;;
;;; libraries
;;;

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

(pushnew (translate-logical-pathname "matron-build:") cffi:*foreign-library-directories*
		 :test #'equal)

(defun load-libraries ()
  (progn
	(cffi:use-foreign-library :udev)
	(cffi:use-foreign-library :evdev)
	(cffi:use-foreign-library :cairo)
	(cffi:use-foreign-library :freetype)
	(cffi:use-foreign-library :monome)
	(cffi:use-foreign-library :matron)))

;; (eval-when (:compile-toplevel :load-toplevel :execute)
;;   (progn
;; 	(cffi:use-foreign-library :udev)
;; 	(cffi:use-foreign-library :evdev)
;; 	(cffi:use-foreign-library :cairo)
;; 	(cffi:use-foreign-library :freetype)
;; 	(cffi:use-foreign-library :monome)
;; 	(cffi:use-foreign-library :matron)))

;;;
;;; ffi generation
;;;


(c-include
 (translate-logical-pathname "matron-src:hardware;gpio.h")
 :exclude-sources ("/usr*"))

(c-include
 (translate-logical-pathname "matron-src:hardware;i2c.h")
 :exclude-sources ("/usr*"))

(c-include
 (translate-logical-pathname "matron-src:hardware;screen.h")
 :exclude-sources ("/usr*"))

(c-include
 (translate-logical-pathname "matron-src:hardware;battery.h")
 :exclude-sources ("/usr*"))

(c-include
 (translate-logical-pathname "matron-src:hardware;stat.h")
 :exclude-sources ("/usr*"))


(c-include
 (translate-logical-pathname "matron-src:device;device_hid.h")
 :exclude-sources ("/usr*"))

(c-include
 (translate-logical-pathname "matron-src:device;device_midi.h")
 :exclude-sources ("/usr*"))

(c-include
 (translate-logical-pathname "matron-src:device;device_monitor.h")
 :exclude-sources ("/usr*"))

(c-include
 (translate-logical-pathname "matron-src:device;device_monome.h")
 :exclude-sources ("/usr*"))

(c-include
 (translate-logical-pathname "matron-src:device;device_list.h")
 :exclude-sources ("/usr*"))

(c-include
 (translate-logical-pathname "matron-src:device;device.h")
 :exclude-sources ("/usr*"))


(c-include
 (translate-logical-pathname "matron-src:events.h")
 :exclude-sources ("/usr*"))

(c-include
 (translate-logical-pathname "matron-src:metro.h")
 :exclude-sources ("/usr*"))

