;;; -*- mode: lisp -*-

(defpackage :siren.asdf
  (:use #:cl #:asdf))

(in-package :siren.asdf)

(defsystem :siren
  :depends-on (:matron)

  :pathname "siren"
  :serial t

  :components
  ((:file "package")
   (:file "matron-device")
   (:file "monome-device")
   (:file "midi-device")
   (:file "hid-device")))


