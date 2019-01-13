;;; -*- mode: lisp -*-

(require 'cffi)
(require 'cl-autowrap)

(defpackage :matron.asdf
  (:use #:cl #:asdf))

(in-package :matron.asdf)

(defsystem :matron
  :description "ffi for mid level matron api"
  :version "0.1"
  
;  :defsystem-depends-on (:cffi-grovel)
  :depends-on (:cffi :cl-autowrap)

  :pathname "matron"
  :serial t

  :components
  ((:file "package")
   (:file "ffi")))
