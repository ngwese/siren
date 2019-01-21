;;; -*- mode: common-lisp -*-

(defpackage :monome.asdf
  (:use #:cl #:asdf))

(in-package :monome.asdf)

(defsystem :monome
  :depends-on (:cffi)

  :pathname "monome"
  :serial t

  :components
  ((:file "package")
   (:file "ffi")))
