(in-package :monome)

(defctype size-t :unsigned-int) 		; FIXME: check this, would be better to cffi-grovel this

;; typedef enum {
;; 	MONOME_BUTTON_UP        = 0x00,
;; 	MONOME_BUTTON_DOWN      = 0x01,
;; 	MONOME_ENCODER_DELTA    = 0x02,
;; 	MONOME_ENCODER_KEY_UP   = 0x03,
;; 	MONOME_ENCODER_KEY_DOWN = 0x04,
;; 	MONOME_TILT             = 0x05,

;; 	/* update this if you add event types */
;; 	MONOME_EVENT_MAX        = 0x06
;; } monome_event_type_t;
(defcenum monome-event-type-t
  (:monome-button-up #x00)
  (:monome-button-down #x01)
  (:monome-encoder-delta #x02)
  (:monome-encoder-key-up #x03)
  (:monome-encoder-key-down #x04)
  (:monome-tilt #x05))
  
;; /* grid rotation */

;; typedef enum {
;; 	MONOME_ROTATE_0    = 0,
;; 	MONOME_ROTATE_90   = 1,
;; 	MONOME_ROTATE_180  = 2,
;; 	MONOME_ROTATE_270  = 3
;; } monome_rotate_t;
(defcenum monome-rotate-t
  (:monome-rotate-0 0)
  (:monome-rotate-90 1)
  (:monome-rotate-180 2)
  (:monome-rotate-270 3))

;; typedef struct monome monome_t; /* opaque data type */
(defctype monome-ptr-t :pointer)
    

;; struct monome_event {
;; 	monome_t *monome;
;; 	monome_event_type_t event_type;

;; 	/* __extension__ for anonymous unions in gcc */
;; 	__extension__ union {
;; 		struct {
;; 			unsigned int x;
;; 			unsigned int y;
;; 		} grid;

;; 		struct {
;; 			unsigned int number;
;; 			int delta;
;; 		} encoder;

;; 		struct {
;; 			unsigned int sensor;
;; 			int x;
;; 			int y;
;; 			int z;
;; 		} tilt;
;; 	};
;; };

(defcstruct monome-event-grid-data-t
  (x :unsigned-int)
  (y :unsigned-int))

(defcstruct monome-event-encoder-data-t
  (number :unsigned-int)
  (delta :int))

(defcstruct monome-event-tilt-data-t
  (sensor :unsigned-int)
  (x :int)
  (y :int)
  (z :int))

(defcunion monome-event-data-t
  (grid (:struct monome-event-grid-data-t))
  (encoder (:struct monome-event-encoder-data-t))
  (tilt (:struct monome-event-tilt-data-t)))

(defcstruct monome-event-t
  (monome monome-ptr-t)
  (event-type monome-event-type-t)
  (data (:union monome-event-data-t)))

;; typedef struct monome_event monome_event_t;
(defctype monome-event-ptr-t (:pointer monome-event-t))

;; typedef void (*monome_event_callback_t)
;; 	(const monome_event_t *event, void *data);
(defctype monome-event-callback-t :pointer)


;; monome_t *monome_open(const char *monome_device, ...);
;; void monome_close(monome_t *monome);

;; void monome_set_rotation(monome_t *monome, monome_rotate_t cable);
(defcfun "monome_set_rotation" :void
  (monome monome-ptr-t)
  (cable monome-rotate-t))

;; monome_rotate_t monome_get_rotation(monome_t *monome);
(defcfun "monome_get_rotation" monome-rotate-t (monome monome-ptr-t))

;; const char *monome_get_serial(monome_t *monome);
(defcfun "monome_get_serial" :string (monome monome-ptr-t))

;; const char *monome_get_devpath(monome_t *monome);
(defcfun "monome_get_devpath" :string (monome monome-ptr-t))

;; const char *monome_get_friendly_name(monome_t *monome);
(defcfun "monome_get_friendly_name" :string (monome monome-ptr-t))

;; const char *monome_get_proto(monome_t *monome);
(defcfun "monome_get_proto" :string (monome monome-ptr-t))

;; int monome_get_rows(monome_t *monome);
(defcfun "monome_get_rows" :int (monome monome-ptr-t))

;; int monome_get_cols(monome_t *monome);
(defcfun "monome_get_cols" :int (monome monome-ptr-t))

;; int monome_register_handler(monome_t *monome, monome_event_type_t event_type,
;;                             monome_event_callback_t, void *user_data);
;; int monome_unregister_handler(monome_t *monome,
;;                               monome_event_type_t event_type);
;; int monome_event_next(monome_t *monome, monome_event_t *event_buf);
;; int monome_event_handle_next(monome_t *monome);
;; void monome_event_loop(monome_t *monome);
;; int monome_get_fd(monome_t *monome);

;; /**
;;  * led grid commands
;;  */
;; int monome_led_set(monome_t *monome, unsigned int x, unsigned int y,
;;                    unsigned int on);
(defcfun "monome_led_set" :int
  (monome monome-ptr-t)
  (x :unsigned-int)
  (y :unsigned-int)
  (on :unsigned-int))

;; int monome_led_on(monome_t *monome, unsigned int x, unsigned int y);
(defcfun "monome_led_on" :int
  (monome monome-ptr-t)
  (x :unsigned-int)
  (y :unsigned-int))

;; int monome_led_off(monome_t *monome, unsigned int x, unsigned int y);
(defcfun "monome_led_off" :int
  (monome monome-ptr-t)
  (x :unsigned-int)
  (y :unsigned-int))

;; int monome_led_all(monome_t *monome, unsigned int status);
(defcfun "monome_led_all" :int
  (monome monome-ptr-t)
  (status :unsigned-int))

;; int monome_led_map(monome_t *monome, unsigned int x_off, unsigned int y_off,
;;                    const uint8_t *data);
(defcfun "monome_led_map" :int
  (monome monome-ptr-t)
  (x-offset :unsigned-int)
  (y-offset :unsigned-int)
  (data (:pointer :uint8)))

;; int monome_led_col(monome_t *monome, unsigned int x, unsigned int y_off,
;;                    size_t count, const uint8_t *col_data);
(defcfun "monome_led_col" :int
  (monome monome-ptr-t)
  (x :unsigned-int)
  (y-offset :unsigned-int)
  (count size-t)
  (column-data (:pointer :uint8)))

;; int monome_led_row(monome_t *monome, unsigned int x_off, unsigned int y,
;;                    size_t count, const uint8_t *row_data);
(defcfun "monome_led_row" :int
  (monome monome-ptr-t)
  (x-offset :unsigned-int)
  (y :unsigned-int)
  (count size-t)
  (row-data (:pointer :uint8)))

;; int monome_led_intensity(monome_t *monome, unsigned int brightness);
(defcfun "monome_led_intensity" :int
  (monome monome-ptr-t)
  (brightness :unsigned-int))

;; int monome_led_level_set(monome_t *monome, unsigned int x, unsigned int y,
;;                          unsigned int level);
(defcfun "monome_led_level_set" :int
  (monome monome-ptr-t)
  (x :unsigned-int)
  (y :unsigned-int)
  (level :unsigned-int))

;; int monome_led_level_all(monome_t *monome, unsigned int level);
(defcfun "monome_led_level_all" :int
  (monome monome-ptr-t)
  (level :unsigned-int))

;; int monome_led_level_map(monome_t *monome, unsigned int x_off,
;;                          unsigned int y_off, const uint8_t *data);
(defcfun "monome_led_level_map" :int
  (monome monome-ptr-t)
  (x-offset :unsigned-int)
  (y-offset :unsigned-int)
  (data (:pointer :uint8)))

;; int monome_led_level_row(monome_t *monome, unsigned int x_off,
;;                          unsigned int y, size_t count, const uint8_t *data);
(defcfun "monome_led_level_row" :int
  (monome monome-ptr-t)
  (x-offset :unsigned-int)
  (y :unsigned-int)
  (count size-t)
  (data (:pointer :uint8)))

;; int monome_led_level_col(monome_t *monome, unsigned int x, unsigned int y_off,
;;                          size_t count, const uint8_t *data);
(defcfun "monome_led_level_col" :int
  (monome monome-ptr-t)
  (x :unsigned-int)
  (y-offset :unsigned-int)
  (count size-t)
  (data (:pointer :uint8)))


;; int monome_event_get_grid(const monome_event_t *e,
;; 			  unsigned int *out_x, unsigned int *out_y,
;; 			  monome_t **monome);
(defcfun "monome_event_get_grid" :int
  (event monome-event-ptr-t)
  (out-x (:pointer :unsigned-int))
  (out-y (:pointer :unsigned-int))
  (monome (:pointer monome-ptr-t)))

;; /**
;;  * led ring commands
;;  */

;; int monome_led_ring_set(monome_t *monome, unsigned int ring, unsigned int led,
;;                         unsigned int level);
(defcfun "monome_led_ring_set" :int
  (monome monome-ptr-t)
  (ring :unsigned-int)
  (led :unsigned-int)
  (level :unsigned-int))

;; int monome_led_ring_all(monome_t *monome, unsigned int ring,
;;                         unsigned int level);
(defcfun "monome_led_ring_all" :int
  (monome monome-ptr-t)
  (ring :unsigned-int)
  (level :unsigned-int))

;; int monome_led_ring_map(monome_t *monome, unsigned int ring,
;;                         const uint8_t *levels);
(defcfun "monome_led_ring_map" :int
  (monome monome-ptr-t)
  (ring :unsigned-int)
  (levels (:pointer :uint8)))

;; int monome_led_ring_range(monome_t *monome, unsigned int ring,
;;                           unsigned int start, unsigned int end,
;;                           unsigned int level);
(defcfun "monome_led_ring_range" :int
  (monome monome-ptr-t)
  (ring :unsigned-int)
  (start :unsigned-int)
  (end :unsigned-int)
  (level :unsigned-int))

;; int monome_tilt_enable(monome_t *monome, unsigned int sensor);
(defcfun "monome_tilt_enable" :int
  (monome monome-ptr-t)
  (sensor :unsigned-int))

;; int monome_tilt_disable(monome_t *monome, unsigned int sensor);
(defcfun "monome_tilt_disable" :int
  (monome monome-ptr-t)
  (sensor :unsigned-int))

