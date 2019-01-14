(in-package :matron)

;;;(defconstant +max-num-metros+ ??)

(defcfun "metros_init" :void)
(defcfun "metro_start" :void
  (idx :int)
  (seconds :double)
  (count :int)
  (stage :int))
(defcfun "metro_stop" :void
  (idx :int))
(defcfun "metro_set_time" :void
  (idx :int)
  (sec :float))

  
