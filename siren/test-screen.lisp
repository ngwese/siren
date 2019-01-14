(in-package :siren-user)

(defun draw-demo ()
  (screen-aa 1)
  
  (screen-clear)
  (screen-level 15)
  (screen-line-width 1d0)
  (screen-move 0d0 0d0)
  (screen-line 10d0 20d0)
  (screen-stroke)
  ;; draw arc: x-center, y-center, radius, angle1, angle2
  (screen-arc 20d0 0d0 10d0 0d0 (* pi 0.8d0))
  (screen-stroke)
  ;; draw rect: x,y,w,h
  (screen-rect 30d0 10d0 15d0 20d0)
  (screen-level 3)
  (screen-stroke)
  ;; draw curve
  (screen-move 50d0 0d0)
  (screen-curve 50d0 20d0 60d0 0d0 70d0 10d0)
  (screen-level 15)
  (screen-stroke)
  ;; draw poly and fill
  (screen-move 60d0 20d0)
  (screen-line 80d0 10d0)
  (screen-line 70d0 40d0)
  (screen-close-path)
  (screen-level 10)
  (screen-fill)
  ;; draw circle
  (screen-circle 100d0 20d0 10d0)
  (screen-stroke)

  (screen-level 15)
  (screen-move 0d0 63d0)
  ;; set text face
  (screen-font-face 9)
  ;; set text size
  (screen-font-size 20d0)
  ;; draw text
  (screen-text "new!")
  ;; draw centered text
  (screen-move 63d0 50d0)
  (screen-font-face 0)
  (screen-font-size 8d0)
  (screen-text-center "center")
  ;; draw right aligned text
  (screen-move 127d0 63d0)
  (screen-text-right "1992")

  (screen-update))

(defun test-screen ()
  (screen-init)
  (gpio-init)
  (battery-init)

  (draw-demo)

  (battery-deinit)
  (gpio-deinit)
  (screen-deinit))
  
  
