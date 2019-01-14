(in-package :matron)

(defcfun "screen_init" :void)
(defcfun "screen_deinit" :void)

(defcfun "screen_update" :void)
(defcfun "screen_save" :void)
(defcfun "screen_restore" :void)

(defcenum screen-font
  (:default-font 0)
  (:04B_03 1)
  (:aleph 2)
  (:roboto-thin 3)
  (:roboto-light 4)
  (:roboto-regular 5)
  (:roboto-medium 6)
  (:roboto-bold 7)
  (:roboto-black 8)
  (:roboto-thin-italic 9)
  (:roboto-light-italic 10)
  (:roboto-italic 11)
  (:roboto-medium-italic 12)
  (:roboto-bold-italic 13)
  (:roboto-black-italic 14))

(defcfun ("screen_font_face" %screen-font-face) :void (i :int))

(defun screen-font-face (enum)
  "set current font by keyword"
  (%screen-font-face (foreign-enum-value 'screen-font enum)))

(defcfun "screen_font_size" :void (z :double))

(defcfun "screen_aa" :void (s :int))
(defcfun "screen_level" :void (z :int))

(defcfun "screen_line" :void (x :double) (y :double))
(defcfun "screen_line_rel" :void (x :double) (y :double))
(defcfun "screen_line_width" :void (w :double))

(defconstant +cap-butt+ "butt")
(defconstant +cap-round+ "round")
(defconstant +cap-square+ "square")

(defcfun "screen_line_cap" :void (style :string))

(defconstant +join-miter+ "miter")
(defconstant +join-round+ "round")
(defconstant +join-bevel+ "bevel")

(defcfun "screen_line_join" :void (style :string))

(defcfun "screen_miter_limit" :void (limit :double))

(defcfun "screen_move" :void (x :double) (y :double))
(defcfun "screen_move_rel" :void (x :double) (y :double))

(defcfun "screen_curve" :void
  (x1 :double)
  (y1 :double)
  (x2 :double)
  (y2 :double)
  (x3 :double)
  (y3 :double))

(defcfun "screen_curve_rel" :void
  (dx1 :double)
  (dy1 :double)
  (dx2 :double)
  (dy2 :double)
  (dx3 :double)
  (dy3 :double))

(defcfun "screen_arc" :void
  (x :double)
  (y :double)
  (r :double)
  (a1 :double)
  (a2 :double))

(defcfun "screen_rect" :void
  (x :double)
  (y :double)
  (w :double)
  (h :double))

(defcfun "screen_stroke" :void)
(defcfun "screen_fill" :void)
(defcfun "screen_text" :void (s :string))
(defcfun "screen_clear" :void)
(defcfun "screen_close_path" :void)

(defcfun ("screen_extents" %screen-extents) (:pointer :double) (s :string))

(defun screen-extents (s)
  (let ((p (%screen-extents s)))
	(values (mem-aref p :double 0)
			(mem-aref p :double 1))))

;;;
;;; helpers
;;;

(defun screen-pixel (x y)
  "draw single pixel (requires integer x/y, fill afterwards)"
  (screen-rect x y 1d0 1d0))

(defun screen-text-right (s)
  "draw text right justified at current vertical position"
  (let ((x (screen-extents s)))
	(screen-move-rel (- x) 0d0)
	(screen-text s)))

(defun screen-text-center (s)
  "draw text centered at current vertical position"
  (let ((x (screen-extents s)))
	(screen-move-rel (/ (- x) 2d0) 0d0)
	(screen-text s)))

(defconstant +circle-arc-length+ (* pi 2))

(defun screen-circle (x y r)
  "draw circle at x,y with the given radius"
  (screen-arc x y r 0d0 +circle-arc-length+))


