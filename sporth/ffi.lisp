(in-package :sporth)

;; /* This is a generated header file */
;; #ifdef MINIMAL
;; #include <stdlib.h>
;; #endif

;; enum {
;; SPORTH_FLOAT,
;; SPORTH_STRING,
;; SPORTH_IGNORE,
;; SPORTH_FUNC,
;; SPORTH_NOTOK,
;; SPORTH_OK,
;; SPORTH_WORD
;; };

(defcenum value-type-t
  :sporth-float
  :sporth-string
  :sporth-ignore
  :sporth-func
  :sporth-notok
  :sporth-ok
  :sporth-word)

;; #define SPORTH_FOFFSET 2
;; #define SPORTH_MAXCHAR 200
;; #define SPORTH_STACK_SIZE 32

(defconstant +sporth-foffset+ 2)
(defconstant +sporth-maxchar+ 200)
(defconstant +sporth-stack-size+ (coerce 32 'real))

;; typedef struct {
;;     float fval;
;;     char *sval;
;;     int type;
;; } sporth_stack_val;

(defcstruct sporth-stack-val-t
  (fval :float)
  (sval :string)
  (type :int))

;; typedef struct {
;;     int pos;
;;     uint32_t error;
;;     sporth_stack_val stack[SPORTH_STACK_SIZE];
;; } sporth_stack;

(defcstruct sporth-stack-t
  (pos :int)
  (error :uint32)
  (stack (:struct sporth-stack-val-t) :count 32)) ; FIXME: switch to +sporth-stack-size+

(defctype sporth-stack-ptr-t (:pointer (:struct sporth-stack-t)))

;; typedef struct sporth_entry {
;;     uint32_t val;
;;     char *key;
;;     struct sporth_entry *next;
;; } sporth_entry;

(defcstruct sporth-entry-t
  (val :uint32)
  (key :string)
  (next (:pointer (:struct sporth-entry-t))))

;; typedef struct {
;;     uint32_t count;
;;     sporth_entry root;
;;     sporth_entry *last;
;; } sporth_list ;

(defcstruct sporth-list-t
  (count :uint32)
  (root (:struct sporth-entry-t))
  (last (:pointer (:struct sporth-entry-t))))

;; typedef struct {
;;     sporth_list list[256];
;; } sporth_htable;

(defcstruct sporth-htable-t
  (list sporth-list-t :count 256))

(defctype sporth-htable-ptr-t (:pointer sporth-htable-t))

;; typedef struct {
;;     const char *name;
;;     int (*func)(sporth_stack *, void *);
;;     void *ud;
;; } sporth_func;

(defctype sporth-func-impl-t (:pointer :void))

(defcstruct sporth-func-t
  (name :string)
  (func sporth-func-impl-t)   ; FIXME: define type for callback
  (ud (:pointer :void)))

;; typedef struct sporth_data {
;;     sporth_htable dict;
;;     uint32_t nfunc;
;;     sporth_func *flist;
;;     sporth_stack stack;
;; } sporth_data;

(defcstruct sporth-data-t
  (dict sporth-htable-t)
  (nfunc :uint32)
  (flist (:pointer (:struct sporth-func-t)))
  (stack (:struct sporth-stack-t)))

;; uint32_t sporth_hash(const char *str);

(defcfun "sporth_hash" :uint32 (str :string))

;; int sporth_search(sporth_htable *ht, const char *key, uint32_t *val);
;; int sporth_htable_add(sporth_htable *ht, const char *key, uint32_t val);
;; int sporth_htable_init(sporth_htable *ht);
;; int sporth_htable_destroy(sporth_htable *ht);

(defcfun "sporth_search" :int
  (ht sporth-htable-ptr-t)
  (key :string)
  (val :uint32))

(defcfun "sporth_htable_add" :int
  (ht sporth-htable-ptr-t)
  (key :string)
  (val :uint32))

(defcfun "sport_htable_init" :int (ht sporth-htable-ptr-t))
(defcfun "sport_htable_destroy" :int (ht sporth-htable-ptr-t))

;; int sporth_stack_init(sporth_stack *stack);
;; int sporth_stack_push_float(sporth_stack *stack, float val);
;; int sporth_stack_push_string(sporth_stack *stack, char **str);
;; float sporth_stack_pop_float(sporth_stack *stack);
;; const char * sporth_stack_pop_string(sporth_stack *stack);
;; int sporth_check_args(sporth_stack *stack, const char *args);
;; int sporth_register_func(sporth_data *sporth, sporth_func *flist);
;; int sporth_exec(sporth_data *sporth, const char *keyword);
;; int sporth_init(sporth_data *sporth);
;; int sporth_destroy(sporth_data *sporth);
;; int sporth_stack_pos(sporth_stack *stack);

;; int sporth_gettype(sporth_data *sporth, char *str, int mode);
;; int sporth_parse(sporth_data *sporth, const char *filename);
;; char * sporth_tokenizer(const char *str,
;;         uint32_t size, uint32_t *pos);
;; int sporth_lexer(char *str, int32_t size);
;; sporth_stack_val * sporth_stack_get_last(sporth_stack *stack);

;; size_t sporth_getline(char **lineptr, size_t *n, FILE *stream);

;; void sporth_print(sporth_data *sporth, const char *fmt, ...);

(defcenum sporth-token-t 
  (:sp-dummy 1) ; FIXME: this is (- +sporth-foffset+ 1)
  :sporth-mul
  :sporth-add
  :sporth-sub
  :sporth-div
  :sporth-markleft
  :sporth-markright
  :sporth-and
  :sporth-or
  :sporth-xor
  :sporth-leftshift
  :sporth-rightshift
  :sporth-mod
  :sporth-abs
  :sporth-adsr
  :sporth-allpass
  :sporth-atone
  :sporth-autowah
  :sporth-addv2
  :sporth-ampdb
  :sporth-bal
  :sporth-biscale
  :sporth-bitcrush
  :sporth-blsaw
  :sporth-blsquare
  :sporth-bltriangle
  :sporth-bpm2dur
  :sporth-bpm2rate
  :sporth-branch
  :sporth-brown
  :sporth-butbp
  :sporth-butbr
  :sporth-buthp
  :sporth-butlp
  :sporth-cdb
  :sporth-cdbload
  :sporth-cdbtab
  :sporth-cf
  :sporth-changed
  :sporth-clip
  :sporth-clock
  :sporth-comb
  :sporth-conv
  :sporth-count
  :sporth-crossfade
  :sporth-dcblk
  :sporth-delay
  :sporth-diode
  :sporth-diskin
  :sporth-dist
  :sporth-divv2
  :sporth-dmetro
  :sporth-drip
  :sporth-drop
  :sporth-dtrig
  :sporth-dup
  :sporth-dup2
  :sporth-dur
  :sporth-durs
  :sporth-dust
  :sporth-eq
  :sporth-eqfil
  :sporth-eval
  :sporth-expon
  :sporth-f
  :sporth-fload
  :sporth-floadi
  :sporth-fclose
  :sporth-fexec
  :sporth-floor
  :sporth-fm
  :sporth-fof
  :sporth-fofilt
  :sporth-fog
  :sporth-fosc
  :sporth-frac
  :sporth-ftsum
  :sporth-gbuzz
  :sporth-gen-eval
  :sporth-gen-file
  :sporth-gen-line
  :sporth-gen-padsynth
  :sporth-gen-sine
  :sporth-gen-rand
  :sporth-gen-composite
  :sporth-gen-sinesum
  :sporth-gen-sporth
  :sporth-gen-vals
  :sporth-get
  :sporth-gt
  :sporth-hilbert
  :sporth-in
  :sporth-incr
  :sporth-inv
  :sporth-jcrev
  :sporth-jitter
  :sporth-limit
  :sporth-line
  :sporth-load
  :sporth-sdelay
  :sporth-slice
  :sporth-slist
  :sporth-sqrt
  :sporth-loadfile
  :sporth-loadspa
  :sporth-log
  :sporth-log10
  :sporth-lpc
  :sporth-lpcsynth
  :sporth-lpf18
  :sporth-lsys
  :sporth-lt
  :sporth-max
  :sporth-maygate
  :sporth-maytrig
  :sporth-metro
  :sporth-mincer
  :sporth-min
  :sporth-mix
  :sporth-mode
  :sporth-moogladder
  :sporth-mtof
  :sporth-mulv2
  :sporth-ne
  :sporth-noise
  :sporth-nsmp
  :sporth-osc
  :sporth-oscmorph4
  :sporth-oscmorph2
  :sporth-p
  :sporth-palias
  :sporth-pan
  :sporth-panst
  :sporth-pareq
  :sporth-paulstretch
  :sporth-pdhalf
  :sporth-peaklim
  :sporth-phaser
  :sporth-phasor
  :sporth-pinknoise
  :sporth-pluck
  :sporth-port
  :sporth-pos
  :sporth-posc3
  :sporth-print
  :sporth-prop
  :sporth-polysporth
  :sporth-pset
  :sporth-psh
  :sporth-pshift
  :sporth-pst
  :sporth-ptrack
  :sporth-rand
  :sporth-randh
  :sporth-randi
  :sporth-ref
  :sporth-render
  :sporth-reson
  :sporth-reverse
  :sporth-revsc
  :sporth-rms
  :sporth-rot
  :sporth-round
  :sporth-rpt
  :sporth-rspline
  :sporth-samphold
  :sporth-saturator
  :sporth-saw
  :sporth-say
  :sporth-scale
  :sporth-scrambler
  :sporth-set
  :sporth-setdurs
  :sporth-sget
  :sporth-sine
  :sporth-smoothdelay
  :sporth-slick
  :sporth-spa
  :sporth-sparec
  :sporth-square
  :sporth-sr
  :sporth-srand
  :sporth-subv2
  :sporth-streson
  :sporth-swap
  :sporth-switch
  :sporth-tabread
  :sporth-tadsr
  :sporth-talias
  :sporth-talkbox
  :sporth-tbldur
  :sporth-tblrec
  :sporth-tblsize
  :sporth-tdiv
  :sporth-tenv
  :sporth-tenv2
  :sporth-tenvx
  :sporth-tgate
  :sporth-tget
  :sporth-thresh
  :sporth-timer
  :sporth-tin
  :sporth-tick
  :sporth-tog
  :sporth-tone
  :sporth-tphasor
  :sporth-tport
  :sporth-tprop
  :sporth-trand
  :sporth-triangle
  :sporth-tri
  :sporth-tseq
  :sporth-tseg
  :sporth-tset
  :sporth-var
  :sporth-varset
  :sporth-vdelay
  :sporth-voc
  :sporth-vocoder
  :sporth-waveset
  :sporth-writecode
  :sporth-wpkorg35
  :sporth-zeros
  :sporth-zitarev
  :sporth-zrev
  :sporth-las)

;; #ifndef PLUMBER_H
;; #define PLUMBER_H

;; /* it just so happens that PLUMBER_OK and SPORTH_OK are the same values */
;; enum {
;; PLUMBER_CREATE,
;; PLUMBER_INIT,
;; PLUMBER_COMPUTE,
;; PLUMBER_DESTROY,
;; PLUMBER_NOTOK,
;; PLUMBER_OK,
;; PLUMBER_PANIC
;; };

;; enum {
;; PTYPE_NIL,
;; PTYPE_TABLE,
;; PTYPE_USERDATA
;; };

;; typedef int (* plumber_func) (sporth_stack *, void *) ;

;; typedef struct plumber_ftbl {
;;     void *ud;
;;     char *name;
;;     char to_delete;
;;     char type;
;;     struct plumber_ftbl *next;
;; } plumber_ftbl;

;; typedef struct {
;;     uint32_t nftbl;
;;     plumber_ftbl root;
;;     plumber_ftbl *last;
;; } plumber_ftentry;

;; typedef struct plumber_pipe {
;;     uint32_t type;
;;     size_t size;
;;     void *ud;
;;     struct plumber_pipe *next;
;; } plumber_pipe;

;; typedef struct {
;;     plumber_func fun;
;;     void *ud;
;; } sporth_func_d;

;; typedef struct {
;;     uint32_t npipes;
;;     int tick;
;;     plumber_pipe root;
;;     plumber_pipe *last;
;; } plumbing;

;; typedef struct plumber_data {
;;     int mode;
;;     uint32_t seed;
;;     sp_data *sp;
;;     FILE *fp;
;;     char *filename;
;;     sporth_data sporth;
;;     plumbing *pipes;
;;     /* for add_module function */
;;     plumbing *tmp;
;;     int current_pipe;
;;     plumbing main, alt;

;;     plumber_ftentry ft1[256];
;;     plumber_ftentry ft2[256];
;;     plumber_ftentry *ftmap;
;;     plumber_ftentry *ftnew, *ftold;
;;     char delete_ft;

;;     SPFLOAT p[16];
;;     void *ud;
;;     plumber_pipe *next;
;;     plumber_pipe *last;
;;     sp_progress *prog;
;;     int showprog;
;;     int recompile;
;;     int stacksize;
;;     char *str;

;;     FILE *log;
;; } plumber_data;

;; typedef int (* plumber_dyn_func) (plumber_data *, sporth_stack *, void **);

;; /* needed for dynamic loading */
;; typedef struct {
;;     sporth_func_d *fd;
;;     plumber_dyn_func fun;
;;     plumber_dyn_func (*getter)(void);
;;     int (*getter_multi)(int, plumber_dyn_func *);
;;     const char *filename;
;;     const char *name;
;;     void *handle;
;;     void *ud;
;; } sporth_fload_d;

;; #ifdef LIVE_CODING
;; #include <pthread.h>
;; typedef struct {
;;     plumber_data *pd;
;;     int start;
;;     pthread_t thread;
;;     int portno;
;; } sporth_listener;
;; void sporth_start_listener(sporth_listener *sl);
;; #endif

;; typedef struct {
;;     unsigned short type;
;;     void *ud;
;; } plumber_ptr;

;; int plumber_init(plumber_data *plumb);
;; int plumber_register(plumber_data *plumb);
;; int plumber_clean(plumber_data *plumb);

;; int plumber_add_float(plumber_data *plumb, plumbing *pipes, float num);
;; char * plumber_add_string(plumber_data *plumb, plumbing *pipes, const char *str);
;; int plumber_add_ugen(plumber_data *plumb, uint32_t id, void *ud);

;; int plumber_compute(plumber_data *plumb, int mode);

;; int plumber_parse(plumber_data *plumb);
;; int plumber_parse_string(plumber_data *plumb, const char *str);

;; int plumber_recompile(plumber_data *plumb);
;; int plumber_recompile_string(plumber_data *plumb, char *str);
;; plumbing *plumbing_choose(plumber_data *plumb,
;;         plumbing *main, plumbing *alt, int *current_pipe);
;; int plumber_reinit(plumber_data *plumb);
;; int plumber_reparse(plumber_data *plumb);
;; int plumber_reparse_string(plumber_data *plumb, char *str);
;; int plumber_recompile_string(plumber_data *plumb, char *str);
;; int plumber_recompile_string_v2(plumber_data *plumb,
;;         char *str,
;;         void *ud,
;;         int (*callback)(plumber_data *, void *));
;; int plumber_recompile_v2(plumber_data *plumb,
;;         void *ud,
;;         int (*callback)(plumber_data *, void *));
;; int plumber_swap(plumber_data *plumb, int error);
;; int plumber_open_file(plumber_data *plumb, const char *filename);
;; int plumber_close_file(plumber_data *plumb);

;; int plumber_gettype(plumber_data *plumb, char *str, int mode);
;; void plumber_show_pipes(plumber_data *plumb);
;; int plumber_error(plumber_data *plumb, const char *str);

;; int plumber_ftmap_init(plumber_data *plumb);
;; int plumber_ftmap_add(plumber_data *plumb, const char *str, sp_ftbl *ft);
;; int plumber_ftmap_add_userdata(plumber_data *plumb, const char *str, void *ud);
;; int plumber_ftmap_add_function(plumber_data *plumb,
;;         const char *str, plumber_dyn_func f, void *ud);
;; int plumber_ftmap_search(plumber_data *plumb, const char *str, sp_ftbl **ft);
;; int plumber_ftmap_search_userdata(plumber_data *plumb, const char *str, void **ud);
;; int plumber_ftmap_destroy(plumber_data *plumb);
;; int plumber_ftmap_delete(plumber_data *plumb, char mode);
;; void plumber_ftmap_dump(plumber_ftentry *ft);
;; plumbing * plumber_get_pipes(plumber_data *plumb);
;; int plumber_search(plumber_data *plumb, const char *str, plumber_ftbl **ft);
;; int plumber_add(plumber_data *plumb, const char *str, plumber_ftbl **ft);

;; void sporth_run(plumber_data *pd, int argc, char *argv[],
;;     void *ud, void (*process)(sp_data *, void *));

;; int plumber_lexer(plumber_data *plumb, plumbing *pipes, char *out, uint32_t len);

;; int plumbing_init(plumbing *pipes);
;; int plumbing_destroy(plumbing *pipes);
;; int plumbing_add_pipe(plumbing *pipes, plumber_pipe *pipe);
;; int plumbing_compute(plumber_data *plumb, plumbing *pipes, int mode);
;; int plumbing_parse(plumber_data *plumb, plumbing *pipes);
;; int plumbing_parse_string(plumber_data *plumb, plumbing *pipes, const char *str);
;; void plumbing_show_pipes(plumber_data *plumb, plumbing *pipes);
;; void plumbing_write_code(plumber_data *plumb, plumbing *pipes, FILE *fp);
;; void plumber_write_code(plumber_data *plumb, FILE *fp);
;; int plumber_process_null(sp_data *sp, void *ud, void (*callback)(sp_data *, void *));

;; int plumber_create_var(plumber_data *pd, const char *name, SPFLOAT **var);

;; int plumber_get_userdata(plumber_data *plumb, const char *name, plumber_ptr **p);
;; int polysporth_eval(plumber_ptr *p, const char *str);

;; void plumber_print(plumber_data *pd, const char *fmt, ...);
;; int plumber_cdbtab(plumber_data *pd, int fd, const char *key, sp_ftbl **ft);

;; int plumber_stack_pos(plumber_data *pd);

;; void plumber_check_stack(plumber_data *pd, int nitems);
;; #endif
