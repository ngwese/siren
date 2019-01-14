(in-package :matron)

(defcfun "i2c_init" :void)
(defcfun "i2c_deinit" :void)
(defcfun "i2c_hp" :void (level :int))

