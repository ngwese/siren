;;; -*- mode: lisp -*-

(defsystem "siren"
  :defsystem-depends-on ("cffi-grovel")
  :depends-on ("cffi")
  :serial t
  :components
  ((:file "package")
   (:file "lib-matron")))
