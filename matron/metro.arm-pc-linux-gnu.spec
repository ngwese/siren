[
{ "tag": "typedef", "ns": 0, "name": "size_t", "location": "/usr/lib/clang/5.0.1/include/stddef.h:62:23", "type": { "tag": ":unsigned-long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "extern", "name": "__tzname", "ns": 0, "location": "/usr/include/time.h:159:14", "type": { "tag": ":array", "type": { "tag": ":pointer", "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } }, "size": 2 } },
{ "tag": "extern", "name": "__daylight", "ns": 0, "location": "/usr/include/time.h:160:12", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "extern", "name": "__timezone", "ns": 0, "location": "/usr/include/time.h:161:17", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "extern", "name": "tzname", "ns": 0, "location": "/usr/include/time.h:166:14", "type": { "tag": ":array", "type": { "tag": ":pointer", "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } }, "size": 2 } },
{ "tag": "extern", "name": "daylight", "ns": 0, "location": "/usr/include/time.h:174:12", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "extern", "name": "timezone", "ns": 0, "location": "/usr/include/time.h:175:17", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "function", "name": "nanosleep", "ns": 0, "location": "/usr/include/time.h:211:12", "variadic": false, "inline": false, "storage-class": "extern", "parameters": [{ "tag": "parameter", "name": "__requested_time", "type": { "tag": ":pointer", "type": { "tag": "struct", "ns": 0, "name": "timespec", "id": 0, "location": "/usr/include/time.h:211:36", "bit-size": 0, "bit-alignment": 0, "fields": [] } } }, { "tag": "parameter", "name": "__remaining", "type": { "tag": ":pointer", "type": { "tag": "struct", "ns": 0, "name": "timespec", "id": 0, "location": "/usr/include/time.h:211:36", "bit-size": 0, "bit-alignment": 0, "fields": [] } } }], "return-type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "enum", "ns": 0, "name": "", "id": 2, "location": "/usr/include/pthread.h:43:1", "fields": [{ "tag": "field", "name": "PTHREAD_MUTEX_TIMED_NP", "value": 0 }, { "tag": "field", "name": "PTHREAD_MUTEX_RECURSIVE_NP", "value": 1 }, { "tag": "field", "name": "PTHREAD_MUTEX_ERRORCHECK_NP", "value": 2 }, { "tag": "field", "name": "PTHREAD_MUTEX_ADAPTIVE_NP", "value": 3 }, { "tag": "field", "name": "PTHREAD_MUTEX_NORMAL", "value": 0 }, { "tag": "field", "name": "PTHREAD_MUTEX_RECURSIVE", "value": 1 }, { "tag": "field", "name": "PTHREAD_MUTEX_ERRORCHECK", "value": 2 }, { "tag": "field", "name": "PTHREAD_MUTEX_DEFAULT", "value": 0 }] },
{ "tag": "enum", "ns": 0, "name": "", "id": 3, "location": "/usr/include/pthread.h:65:1", "fields": [{ "tag": "field", "name": "PTHREAD_MUTEX_STALLED", "value": 0 }, { "tag": "field", "name": "PTHREAD_MUTEX_STALLED_NP", "value": 0 }, { "tag": "field", "name": "PTHREAD_MUTEX_ROBUST", "value": 1 }, { "tag": "field", "name": "PTHREAD_MUTEX_ROBUST_NP", "value": 1 }] },
{ "tag": "enum", "ns": 0, "name": "", "id": 4, "location": "/usr/include/pthread.h:77:1", "fields": [{ "tag": "field", "name": "PTHREAD_PRIO_NONE", "value": 0 }, { "tag": "field", "name": "PTHREAD_PRIO_INHERIT", "value": 1 }, { "tag": "field", "name": "PTHREAD_PRIO_PROTECT", "value": 2 }] },
{ "tag": "enum", "ns": 0, "name": "", "id": 5, "location": "/usr/include/pthread.h:115:1", "fields": [{ "tag": "field", "name": "PTHREAD_RWLOCK_PREFER_READER_NP", "value": 0 }, { "tag": "field", "name": "PTHREAD_RWLOCK_PREFER_WRITER_NP", "value": 1 }, { "tag": "field", "name": "PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP", "value": 2 }, { "tag": "field", "name": "PTHREAD_RWLOCK_DEFAULT_NP", "value": 0 }] },
{ "tag": "enum", "ns": 0, "name": "", "id": 6, "location": "/usr/include/pthread.h:156:1", "fields": [{ "tag": "field", "name": "PTHREAD_INHERIT_SCHED", "value": 0 }, { "tag": "field", "name": "PTHREAD_EXPLICIT_SCHED", "value": 1 }] },
{ "tag": "enum", "ns": 0, "name": "", "id": 7, "location": "/usr/include/pthread.h:166:1", "fields": [{ "tag": "field", "name": "PTHREAD_SCOPE_SYSTEM", "value": 0 }, { "tag": "field", "name": "PTHREAD_SCOPE_PROCESS", "value": 1 }] },
{ "tag": "enum", "ns": 0, "name": "", "id": 8, "location": "/usr/include/pthread.h:176:1", "fields": [{ "tag": "field", "name": "PTHREAD_PROCESS_PRIVATE", "value": 0 }, { "tag": "field", "name": "PTHREAD_PROCESS_SHARED", "value": 1 }] },
{ "tag": "struct", "ns": 0, "name": "_pthread_cleanup_buffer", "id": 0, "location": "/usr/include/pthread.h:191:8", "bit-size": 128, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "__routine", "bit-offset": 0, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":function-pointer" } }, { "tag": "field", "name": "__arg", "bit-offset": 32, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":pointer", "type": { "tag": ":void" } } }, { "tag": "field", "name": "__canceltype", "bit-offset": 64, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "__prev", "bit-offset": 96, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":pointer", "type": { "tag": ":struct", "name": "_pthread_cleanup_buffer", "id": 9 } } }] },
{ "tag": "enum", "ns": 0, "name": "", "id": 10, "location": "/usr/include/pthread.h:200:1", "fields": [{ "tag": "field", "name": "PTHREAD_CANCEL_ENABLE", "value": 0 }, { "tag": "field", "name": "PTHREAD_CANCEL_DISABLE", "value": 1 }] },
{ "tag": "enum", "ns": 0, "name": "", "id": 11, "location": "/usr/include/pthread.h:207:1", "fields": [{ "tag": "field", "name": "PTHREAD_CANCEL_DEFERRED", "value": 0 }, { "tag": "field", "name": "PTHREAD_CANCEL_ASYNCHRONOUS", "value": 1 }] },
{ "tag": "function", "name": "pthread_exit", "ns": 0, "location": "/usr/include/pthread.h:243:13", "variadic": false, "inline": false, "storage-class": "extern", "parameters": [{ "tag": "parameter", "name": "__retval", "type": { "tag": ":pointer", "type": { "tag": ":void" } } }], "return-type": { "tag": ":void" } },
{ "tag": "function", "name": "pthread_setcancelstate", "ns": 0, "location": "/usr/include/pthread.h:507:12", "variadic": false, "inline": false, "storage-class": "extern", "parameters": [{ "tag": "parameter", "name": "__state", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "parameter", "name": "__oldstate", "type": { "tag": ":pointer", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } } }], "return-type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "function", "name": "pthread_setcanceltype", "ns": 0, "location": "/usr/include/pthread.h:511:12", "variadic": false, "inline": false, "storage-class": "extern", "parameters": [{ "tag": "parameter", "name": "__type", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "parameter", "name": "__oldtype", "type": { "tag": ":pointer", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } } }], "return-type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "function", "name": "pthread_testcancel", "ns": 0, "location": "/usr/include/pthread.h:519:13", "variadic": false, "inline": false, "storage-class": "extern", "parameters": [], "return-type": { "tag": ":void" } },
{ "tag": "struct", "ns": 0, "name": "__pthread_cleanup_frame", "id": 0, "location": "/usr/include/pthread.h:541:8", "bit-size": 128, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "__cancel_routine", "bit-offset": 0, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":function-pointer" } }, { "tag": "field", "name": "__cancel_arg", "bit-offset": 32, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":pointer", "type": { "tag": ":void" } } }, { "tag": "field", "name": "__do_it", "bit-offset": 64, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "__cancel_type", "bit-offset": 96, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "function", "name": "__pthread_register_cancel", "ns": 0, "location": "/usr/include/pthread.h:681:13", "variadic": false, "inline": false, "storage-class": "extern", "parameters": [{ "tag": "parameter", "name": "__buf", "type": { "tag": ":pointer", "type": { "tag": "__pthread_unwind_buf_t" } } }], "return-type": { "tag": ":void" } },
{ "tag": "function", "name": "__pthread_unregister_cancel", "ns": 0, "location": "/usr/include/pthread.h:693:13", "variadic": false, "inline": false, "storage-class": "extern", "parameters": [{ "tag": "parameter", "name": "__buf", "type": { "tag": ":pointer", "type": { "tag": "__pthread_unwind_buf_t" } } }], "return-type": { "tag": ":void" } },
{ "tag": "function", "name": "__pthread_unwind_next", "ns": 0, "location": "/usr/include/pthread.h:734:13", "variadic": false, "inline": false, "storage-class": "extern", "parameters": [{ "tag": "parameter", "name": "__buf", "type": { "tag": ":pointer", "type": { "tag": "__pthread_unwind_buf_t" } } }], "return-type": { "tag": ":void" } },
{ "tag": "struct", "ns": 0, "name": "__jmp_buf_tag", "id": 0, "location": "/usr/include/pthread.h:743:8", "bit-size": 0, "bit-alignment": 0, "fields": [] },
{ "tag": "typedef", "ns": 0, "name": "int_least16_t", "location": "/usr/include/stdint.h:44:20", "type": { "tag": ":short", "bit-size": 16, "bit-alignment": 16 } },
{ "tag": "typedef", "ns": 0, "name": "int_least32_t", "location": "/usr/include/stdint.h:45:15", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "typedef", "ns": 0, "name": "int_least64_t", "location": "/usr/include/stdint.h:50:24", "type": { "tag": ":long-long", "bit-size": 64, "bit-alignment": 32 } },
{ "tag": "typedef", "ns": 0, "name": "uint_least8_t", "location": "/usr/include/stdint.h:54:24", "type": { "tag": ":unsigned-char", "bit-size": 8, "bit-alignment": 8 } },
{ "tag": "typedef", "ns": 0, "name": "uint_least16_t", "location": "/usr/include/stdint.h:55:28", "type": { "tag": ":unsigned-short", "bit-size": 16, "bit-alignment": 16 } },
{ "tag": "typedef", "ns": 0, "name": "uint_least32_t", "location": "/usr/include/stdint.h:56:23", "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "typedef", "ns": 0, "name": "uint_least64_t", "location": "/usr/include/stdint.h:61:32", "type": { "tag": ":unsigned-long-long", "bit-size": 64, "bit-alignment": 32 } },
{ "tag": "typedef", "ns": 0, "name": "int_fast8_t", "location": "/usr/include/stdint.h:68:22", "type": { "tag": ":signed-char", "bit-size": 8, "bit-alignment": 8 } },
{ "tag": "typedef", "ns": 0, "name": "int_fast16_t", "location": "/usr/include/stdint.h:74:15", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "typedef", "ns": 0, "name": "int_fast32_t", "location": "/usr/include/stdint.h:75:15", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "typedef", "ns": 0, "name": "int_fast64_t", "location": "/usr/include/stdint.h:77:24", "type": { "tag": ":long-long", "bit-size": 64, "bit-alignment": 32 } },
{ "tag": "typedef", "ns": 0, "name": "uint_fast8_t", "location": "/usr/include/stdint.h:81:24", "type": { "tag": ":unsigned-char", "bit-size": 8, "bit-alignment": 8 } },
{ "tag": "typedef", "ns": 0, "name": "uint_fast16_t", "location": "/usr/include/stdint.h:87:23", "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "typedef", "ns": 0, "name": "uint_fast32_t", "location": "/usr/include/stdint.h:88:23", "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "typedef", "ns": 0, "name": "uint_fast64_t", "location": "/usr/include/stdint.h:90:32", "type": { "tag": ":unsigned-long-long", "bit-size": 64, "bit-alignment": 32 } },
{ "tag": "typedef", "ns": 0, "name": "intptr_t", "location": "/usr/include/stdint.h:103:15", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "typedef", "ns": 0, "name": "uintptr_t", "location": "/usr/include/stdint.h:106:23", "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "extern", "name": "MAX_NUM_METROS", "ns": 0, "location": "/home/greg/proj/norns/matron/src/metro.h:7:18", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "function", "name": "metros_init", "ns": 0, "location": "/home/greg/proj/norns/matron/src/metro.h:10:13", "variadic": false, "inline": false, "storage-class": "extern", "parameters": [], "return-type": { "tag": ":void" } },
{ "tag": "function", "name": "metro_start", "ns": 0, "location": "/home/greg/proj/norns/matron/src/metro.h:14:13", "variadic": false, "inline": false, "storage-class": "extern", "parameters": [{ "tag": "parameter", "name": "idx", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "parameter", "name": "seconds", "type": { "tag": ":double", "bit-size": 64, "bit-alignment": 32 } }, { "tag": "parameter", "name": "count", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "parameter", "name": "stage", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }], "return-type": { "tag": ":void" } },
{ "tag": "function", "name": "metro_stop", "ns": 0, "location": "/home/greg/proj/norns/matron/src/metro.h:17:13", "variadic": false, "inline": false, "storage-class": "extern", "parameters": [{ "tag": "parameter", "name": "idx", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }], "return-type": { "tag": ":void" } },
{ "tag": "function", "name": "metro_set_time", "ns": 0, "location": "/home/greg/proj/norns/matron/src/metro.h:22:13", "variadic": false, "inline": false, "storage-class": "extern", "parameters": [{ "tag": "parameter", "name": "idx", "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "parameter", "name": "sec", "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }], "return-type": { "tag": ":void" } },
{ "tag": "const", "name": "_TIME_H", "ns": 0, "location": "/usr/include/time.h:23:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "TIME_UTC", "ns": 0, "location": "/usr/include/time.h:65:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "__sched_priority", "ns": 0, "location": "/usr/include/sched.h:48:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "sched_priority", "ns": 0, "location": "/usr/include/sched.h:47:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "_SIZE_T", "ns": 0, "location": "/usr/lib/clang/5.0.1/include/stddef.h:60:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "NULL", "ns": 0, "location": "/usr/lib/clang/5.0.1/include/stddef.h:105:11", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "__pid_t_defined", "ns": 0, "location": "/usr/include/sched.h:39:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "_SCHED_H", "ns": 0, "location": "/usr/include/sched.h:20:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "__need_size_t", "ns": 0, "location": "/tmp/tmp1M71MD7G.tmp:9:12", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "__need_NULL", "ns": 0, "location": "/tmp/tmp1M71MD7G.tmp:10:12", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "PTHREAD_BARRIER_SERIAL_THREAD", "ns": 0, "location": "/usr/include/pthread.h:225:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -1 },
{ "tag": "const", "name": "PTHREAD_CANCEL_DEFERRED", "ns": 0, "location": "/usr/include/pthread.h:210:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "PTHREAD_CANCEL_ASYNCHRONOUS", "ns": 0, "location": "/usr/include/pthread.h:212:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "PTHREAD_CANCELED", "ns": 0, "location": "/usr/include/pthread.h:214:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -1 },
{ "tag": "const", "name": "PTHREAD_ONCE_INIT", "ns": 0, "location": "/usr/include/pthread.h:218:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "PTHREAD_CANCEL_ENABLE", "ns": 0, "location": "/usr/include/pthread.h:203:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "PTHREAD_CANCEL_DISABLE", "ns": 0, "location": "/usr/include/pthread.h:205:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "PTHREAD_PROCESS_SHARED", "ns": 0, "location": "/usr/include/pthread.h:181:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "PTHREAD_COND_INITIALIZER", "ns": 0, "location": "/usr/include/pthread.h:187:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "__USE_POSIX", "ns": 0, "location": "/usr/include/features.h:300:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "__USE_ISOC95", "ns": 0, "location": "/usr/include/features.h:318:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "__USE_ISOC99", "ns": 0, "location": "/usr/include/features.h:320:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "__USE_ISOC11", "ns": 0, "location": "/usr/include/features.h:227:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "_FEATURES_H", "ns": 0, "location": "/usr/include/features.h:19:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "_PTHREAD_H", "ns": 0, "location": "/usr/include/pthread.h:19:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "_STDC_PREDEF_H", "ns": 0, "location": "/usr/include/stdc-predef.h:19:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "__STDC_IEC_559__", "ns": 0, "location": "/usr/include/stdc-predef.h:41:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "__STDC_IEC_559_COMPLEX__", "ns": 0, "location": "/usr/include/stdc-predef.h:49:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "__STDC_NO_THREADS__", "ns": 0, "location": "/usr/include/stdc-predef.h:61:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "__STDC_ISO_10646__", "ns": 0, "location": "/usr/include/stdc-predef.h:58:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 201706 },
{ "tag": "const", "name": "PTHREAD_MUTEX_INITIALIZER", "ns": 0, "location": "/usr/include/pthread.h:99:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "__GLIBC__", "ns": 0, "location": "/usr/include/features.h:415:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 2 },
{ "tag": "const", "name": "__GLIBC_MINOR__", "ns": 0, "location": "/usr/include/features.h:416:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 27 },
{ "tag": "const", "name": "__GNU_LIBRARY__", "ns": 0, "location": "/usr/include/features.h:411:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 6 },
{ "tag": "const", "name": "INT_LEAST32_MIN", "ns": 0, "location": "/usr/include/stdint.h:146:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -2147483648 },
{ "tag": "const", "name": "__USE_POSIX2", "ns": 0, "location": "/usr/include/features.h:304:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "__USE_POSIX199309", "ns": 0, "location": "/usr/include/features.h:308:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "INT_LEAST16_MIN", "ns": 0, "location": "/usr/include/stdint.h:145:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -32768 },
{ "tag": "const", "name": "__USE_POSIX199506", "ns": 0, "location": "/usr/include/features.h:312:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "INT_LEAST8_MIN", "ns": 0, "location": "/usr/include/stdint.h:144:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -128 },
{ "tag": "const", "name": "UINT64_MAX", "ns": 0, "location": "/usr/include/stdint.h:140:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -1 },
{ "tag": "const", "name": "__LITTLE_ENDIAN", "ns": 0, "location": "/usr/include/endian.h:31:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1234 },
{ "tag": "const", "name": "_ENDIAN_H", "ns": 0, "location": "/usr/include/endian.h:19:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "PTHREAD_CREATE_JOINABLE", "ns": 0, "location": "/usr/include/pthread.h:36:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "INT_LEAST16_MAX", "ns": 0, "location": "/usr/include/stdint.h:150:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 32767 },
{ "tag": "const", "name": "PTHREAD_CREATE_DETACHED", "ns": 0, "location": "/usr/include/pthread.h:38:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "INT_LEAST32_MAX", "ns": 0, "location": "/usr/include/stdint.h:151:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 2147483647 },
{ "tag": "const", "name": "__PDP_ENDIAN", "ns": 0, "location": "/usr/include/endian.h:33:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 3412 },
{ "tag": "const", "name": "__USE_XOPEN2K", "ns": 0, "location": "/usr/include/features.h:316:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "INT_LEAST8_MAX", "ns": 0, "location": "/usr/include/stdint.h:149:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 127 },
{ "tag": "const", "name": "INT_LEAST64_MIN", "ns": 0, "location": "/usr/include/stdint.h:147:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "__BIG_ENDIAN", "ns": 0, "location": "/usr/include/endian.h:32:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 4321 },
{ "tag": "const", "name": "__USE_XOPEN2K8", "ns": 0, "location": "/usr/include/features.h:324:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "INT16_MAX", "ns": 0, "location": "/usr/include/stdint.h:132:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 32767 },
{ "tag": "const", "name": "__FLOAT_WORD_ORDER", "ns": 0, "location": "/usr/include/endian.h:41:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "INT8_MAX", "ns": 0, "location": "/usr/include/stdint.h:131:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 127 },
{ "tag": "const", "name": "BIG_ENDIAN", "ns": 0, "location": "/usr/include/endian.h:46:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 4321 },
{ "tag": "const", "name": "INT64_MIN", "ns": 0, "location": "/usr/include/stdint.h:129:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "INT16_MIN", "ns": 0, "location": "/usr/include/stdint.h:127:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -32768 },
{ "tag": "const", "name": "LITTLE_ENDIAN", "ns": 0, "location": "/usr/include/endian.h:45:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1234 },
{ "tag": "const", "name": "INT32_MIN", "ns": 0, "location": "/usr/include/stdint.h:128:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -2147483648 },
{ "tag": "const", "name": "UINT16_MAX", "ns": 0, "location": "/usr/include/stdint.h:138:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 65535 },
{ "tag": "const", "name": "BYTE_ORDER", "ns": 0, "location": "/usr/include/endian.h:48:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "UINT8_MAX", "ns": 0, "location": "/usr/include/stdint.h:137:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 255 },
{ "tag": "const", "name": "UINT32_MAX", "ns": 0, "location": "/usr/include/stdint.h:139:10", "type": { "tag": ":unsigned-long", "bit-size": 32, "bit-alignment": 32 }, "value": 4294967295 },
{ "tag": "const", "name": "PDP_ENDIAN", "ns": 0, "location": "/usr/include/endian.h:47:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 3412 },
{ "tag": "const", "name": "INT64_MAX", "ns": 0, "location": "/usr/include/stdint.h:134:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -1 },
{ "tag": "const", "name": "INT32_MAX", "ns": 0, "location": "/usr/include/stdint.h:133:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 2147483647 },
{ "tag": "const", "name": "PTHREAD_INHERIT_SCHED", "ns": 0, "location": "/usr/include/pthread.h:159:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "PTHREAD_RWLOCK_INITIALIZER", "ns": 0, "location": "/usr/include/pthread.h:133:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "__USE_MISC", "ns": 0, "location": "/usr/include/features.h:368:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "PTHREAD_PROCESS_PRIVATE", "ns": 0, "location": "/usr/include/pthread.h:179:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "__USE_ATFILE", "ns": 0, "location": "/usr/include/features.h:372:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "PTHREAD_SCOPE_PROCESS", "ns": 0, "location": "/usr/include/pthread.h:171:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "INT8_MIN", "ns": 0, "location": "/usr/include/stdint.h:126:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -128 },
{ "tag": "const", "name": "PTHREAD_SCOPE_SYSTEM", "ns": 0, "location": "/usr/include/pthread.h:169:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "__USE_FORTIFY_LEVEL", "ns": 0, "location": "/usr/include/features.h:387:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "PTHREAD_EXPLICIT_SCHED", "ns": 0, "location": "/usr/include/pthread.h:161:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "__KERNEL_STRICT_NAMES", "ns": 0, "location": "/usr/include/features.h:147:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "__GLIBC_USE_DEPRECATED_GETS", "ns": 0, "location": "/usr/include/features.h:395:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "__intptr_t_defined", "ns": 0, "location": "/usr/include/stdint.h:104:11", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "_DEFAULT_SOURCE", "ns": 0, "location": "/usr/include/features.h:221:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "_POSIX_SOURCE", "ns": 0, "location": "/usr/include/features.h:263:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "__cleanup_fct_attribute", "ns": 0, "location": "/usr/include/pthread.h:536:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "INT_FAST8_MIN", "ns": 0, "location": "/usr/include/stdint.h:162:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -128 },
{ "tag": "const", "name": "_POSIX_C_SOURCE", "ns": 0, "location": "/usr/include/features.h:265:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 200809 },
{ "tag": "const", "name": "UINT_LEAST64_MAX", "ns": 0, "location": "/usr/include/stdint.h:158:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -1 },
{ "tag": "const", "name": "INT_FAST64_MIN", "ns": 0, "location": "/usr/include/stdint.h:170:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "INT_FAST32_MIN", "ns": 0, "location": "/usr/include/stdint.h:168:11", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -2147483648 },
{ "tag": "const", "name": "INT_FAST16_MIN", "ns": 0, "location": "/usr/include/stdint.h:167:11", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -2147483648 },
{ "tag": "const", "name": "_STDINT_H", "ns": 0, "location": "/usr/include/stdint.h:23:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "UINT_LEAST8_MAX", "ns": 0, "location": "/usr/include/stdint.h:155:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 255 },
{ "tag": "const", "name": "INT_LEAST64_MAX", "ns": 0, "location": "/usr/include/stdint.h:152:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -1 },
{ "tag": "const", "name": "__GLIBC_INTERNAL_STARTING_HEADER_IMPLEMENTATION", "ns": 0, "location": "/usr/include/stdint.h:25:9", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "__USE_POSIX_IMPLICITLY", "ns": 0, "location": "/usr/include/features.h:260:11", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "UINT_LEAST32_MAX", "ns": 0, "location": "/usr/include/stdint.h:157:10", "type": { "tag": ":unsigned-long", "bit-size": 32, "bit-alignment": 32 }, "value": 4294967295 },
{ "tag": "const", "name": "_ATFILE_SOURCE", "ns": 0, "location": "/usr/include/features.h:326:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 1 },
{ "tag": "const", "name": "UINT_LEAST16_MAX", "ns": 0, "location": "/usr/include/stdint.h:156:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 65535 },
{ "tag": "const", "name": "UINT_FAST32_MAX", "ns": 0, "location": "/usr/include/stdint.h:189:11", "type": { "tag": ":unsigned-long", "bit-size": 32, "bit-alignment": 32 }, "value": 4294967295 },
{ "tag": "const", "name": "UINT_FAST64_MAX", "ns": 0, "location": "/usr/include/stdint.h:191:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -1 },
{ "tag": "const", "name": "INTPTR_MIN", "ns": 0, "location": "/usr/include/stdint.h:200:11", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -2147483648 },
{ "tag": "const", "name": "UINT_FAST8_MAX", "ns": 0, "location": "/usr/include/stdint.h:183:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 255 },
{ "tag": "const", "name": "UINT_FAST16_MAX", "ns": 0, "location": "/usr/include/stdint.h:188:11", "type": { "tag": ":unsigned-long", "bit-size": 32, "bit-alignment": 32 }, "value": 4294967295 },
{ "tag": "const", "name": "INT_FAST32_MAX", "ns": 0, "location": "/usr/include/stdint.h:178:11", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 2147483647 },
{ "tag": "const", "name": "INT_FAST8_MAX", "ns": 0, "location": "/usr/include/stdint.h:172:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 127 },
{ "tag": "const", "name": "INT_FAST16_MAX", "ns": 0, "location": "/usr/include/stdint.h:177:11", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 2147483647 },
{ "tag": "const", "name": "INT_FAST64_MAX", "ns": 0, "location": "/usr/include/stdint.h:180:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -1 },
{ "tag": "const", "name": "PTRDIFF_MAX", "ns": 0, "location": "/usr/include/stdint.h:227:12", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 2147483647 },
{ "tag": "const", "name": "UINTMAX_MAX", "ns": 0, "location": "/usr/include/stdint.h:212:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -1 },
{ "tag": "const", "name": "INTMAX_MIN", "ns": 0, "location": "/usr/include/stdint.h:207:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "INTMAX_MAX", "ns": 0, "location": "/usr/include/stdint.h:209:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -1 },
{ "tag": "const", "name": "INTPTR_MAX", "ns": 0, "location": "/usr/include/stdint.h:201:11", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 2147483647 },
{ "tag": "const", "name": "UINTPTR_MAX", "ns": 0, "location": "/usr/include/stdint.h:202:11", "type": { "tag": ":unsigned-long", "bit-size": 32, "bit-alignment": 32 }, "value": 4294967295 },
{ "tag": "const", "name": "WINT_MIN", "ns": 0, "location": "/usr/include/stdint.h:254:10", "type": { "tag": ":unsigned-long", "bit-size": 32, "bit-alignment": 32 }, "value": 0 },
{ "tag": "const", "name": "SIZE_MAX", "ns": 0, "location": "/usr/include/stdint.h:242:12", "type": { "tag": ":unsigned-long", "bit-size": 32, "bit-alignment": 32 }, "value": 4294967295 },
{ "tag": "const", "name": "WCHAR_MIN", "ns": 0, "location": "/usr/include/stdint.h:249:11", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "SIG_ATOMIC_MAX", "ns": 0, "location": "/usr/include/stdint.h:233:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": 2147483647 },
{ "tag": "const", "name": "SIG_ATOMIC_MIN", "ns": 0, "location": "/usr/include/stdint.h:232:10", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -2147483648 },
{ "tag": "const", "name": "WCHAR_MAX", "ns": 0, "location": "/usr/include/stdint.h:250:11", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 } },
{ "tag": "const", "name": "WINT_MAX", "ns": 0, "location": "/usr/include/stdint.h:255:10", "type": { "tag": ":unsigned-long", "bit-size": 32, "bit-alignment": 32 }, "value": 4294967295 },
{ "tag": "const", "name": "PTRDIFF_MIN", "ns": 0, "location": "/usr/include/stdint.h:226:12", "type": { "tag": ":long", "bit-size": 32, "bit-alignment": 32 }, "value": -2147483648 }
]
