;;; -*- mode: lisp -*-

(require 'cffi)

(defpackage :matron.asdf
  (:use #:cl #:asdf))

(in-package :matron.asdf)

(defsystem :matron
  :description "ffi for mid level matron api"
  :version "0.1"
  
  :depends-on (:cffi)

  :pathname "matron"
  :serial t

  :components
  ((:file "package")
   (:file "ffi")
   (:file "gpio")
   (:file "i2c")
   (:file "battery")
   (:file "screen")
   (:file "stat")
   (:file "metro")
   (:file "events")
   (:file "event-types")
   (:file "device")
   (:file "device-hid")
   (:file "device-monome")
   (:file "device-midi")
   (:file "device-monitor")
   (:file "device-list")))
