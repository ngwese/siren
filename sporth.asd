;;; -*- mode: common-lisp -*-

(defpackage :sporth.asdf
  (:use #:cl #:asdf))

(in-package :sporth.asdf)

(defsystem :sporth
  :depends-on (:cffi)

  :pathname "sporth"
  :serial t

  :components
  ((:file "package")
   (:file "ffi")))
