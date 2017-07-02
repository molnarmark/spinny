/* Generated by Nim Compiler v0.16.0 */
/*   (c) 2017 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w -pthread  -I/opt/nim/lib -o /home/me/Desktop/Code/Nim/Spinny/nimcache/stdlib_locks.o /home/me/Desktop/Code/Nim/Spinny/nimcache/stdlib_locks.c */
#define NIM_INTBITS 64

#include "nimbase.h"
#include <pthread.h>
#include <sys/types.h>
                          #include <pthread.h>
#undef linux
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
typedef NU8 Tnimkind_jIBKr1ejBgsfM33Kxw4j7A;
typedef NU8 Tnimtypeflag_v8QUszD1sWlSIWZz7mC4bQ_Set;
typedef N_NIMCALL_PTR(void, TY_ojoeKfW4VYIm36I9cpDTQIg) (void* p0, NI op0);
typedef N_NIMCALL_PTR(void*, TY_WSm2xU5ARYv9aAR4l0z9c9auQ) (void* p0);
struct  TNimType  {
NI size;
Tnimkind_jIBKr1ejBgsfM33Kxw4j7A kind;
Tnimtypeflag_v8QUszD1sWlSIWZz7mC4bQ_Set flags;
TNimType* base;
TNimNode* node;
void* finalizer;
TY_ojoeKfW4VYIm36I9cpDTQIg marker;
TY_WSm2xU5ARYv9aAR4l0z9c9auQ deepcopy;
};
typedef NU8 Tnimnodekind_unfNsxrcATrufDZmpBq4HQ;
struct  TNimNode  {
Tnimnodekind_unfNsxrcATrufDZmpBq4HQ kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
};
static N_INLINE(NIM_BOOL, tryacquiresys_1IhqNgQW3p2BHbc9bb4WjNAlocks)(pthread_mutex_t* L0);
static N_INLINE(void, initlock_NXoRcxfV39aV9cflSTUwtJ1glocks)(pthread_mutex_t* lock0);
static N_INLINE(void, deinitlock_NXoRcxfV39aV9cflSTUwtJ1g_2locks)(pthread_mutex_t* lock0);
N_NIMCALL(NIM_BOOL, tryacquire_RVpMCi0dWU5mH1GyAP2R5w)(pthread_mutex_t* lock0);
N_NIMCALL(void, acquire_9bBEZeGCRkWQl9bLT1qt423Q)(pthread_mutex_t* lock0);
N_NIMCALL(void, release_9bBEZeGCRkWQl9bLT1qt423Q_2)(pthread_mutex_t* lock0);
static N_INLINE(void, initcond_WRFSiAr3z0qoVkqr9c7EaqQlocks)(pthread_cond_t* cond0);
static N_INLINE(void, deinitcond_WRFSiAr3z0qoVkqr9c7EaqQ_2locks)(pthread_cond_t* cond0);
static N_INLINE(void, wait_C8C25W9c9aLsapjtr1flPecglocks)(pthread_cond_t* cond0, pthread_mutex_t* lock0);
static N_INLINE(void, signal_WRFSiAr3z0qoVkqr9c7EaqQ_3locks)(pthread_cond_t* cond0);
TNimType NTI_9bK5SEAqe27K49aDtonge9aQg;
TNimType NTI_lsB6JckQ3csMuiRW476VWg;

static N_INLINE(NIM_BOOL, tryacquiresys_1IhqNgQW3p2BHbc9bb4WjNAlocks)(pthread_mutex_t* L0) {
	NIM_BOOL result0;
	int LOC1;
	result0 = (NIM_BOOL)0;
	LOC1 = (int)0;
	LOC1 = pthread_mutex_trylock(L0);
	result0 = (LOC1 == ((NI32) 0));
	return result0;
}

static N_INLINE(void, initlock_NXoRcxfV39aV9cflSTUwtJ1glocks)(pthread_mutex_t* lock0) {
	pthread_mutex_init(lock0, NIM_NIL);
}

static N_INLINE(void, deinitlock_NXoRcxfV39aV9cflSTUwtJ1g_2locks)(pthread_mutex_t* lock0) {
	pthread_mutex_destroy(lock0);
}

N_NIMCALL(NIM_BOOL, tryacquire_RVpMCi0dWU5mH1GyAP2R5w)(pthread_mutex_t* lock0) {
	NIM_BOOL result0;
	result0 = (NIM_BOOL)0;
	result0 = tryacquiresys_1IhqNgQW3p2BHbc9bb4WjNAlocks(lock0);
	return result0;
}

N_NIMCALL(void, acquire_9bBEZeGCRkWQl9bLT1qt423Q)(pthread_mutex_t* lock0) {
	pthread_mutex_lock(lock0);
}

N_NIMCALL(void, release_9bBEZeGCRkWQl9bLT1qt423Q_2)(pthread_mutex_t* lock0) {
	pthread_mutex_unlock(lock0);
}

static N_INLINE(void, initcond_WRFSiAr3z0qoVkqr9c7EaqQlocks)(pthread_cond_t* cond0) {
	pthread_cond_init(cond0, NIM_NIL);
}

static N_INLINE(void, deinitcond_WRFSiAr3z0qoVkqr9c7EaqQ_2locks)(pthread_cond_t* cond0) {
	pthread_cond_destroy(cond0);
}

static N_INLINE(void, wait_C8C25W9c9aLsapjtr1flPecglocks)(pthread_cond_t* cond0, pthread_mutex_t* lock0) {
	pthread_cond_wait(cond0, lock0);
}

static N_INLINE(void, signal_WRFSiAr3z0qoVkqr9c7EaqQ_3locks)(pthread_cond_t* cond0) {
	pthread_cond_signal(cond0);
}
NIM_EXTERNC N_NOINLINE(void, stdlib_locksInit000)(void) {
}

NIM_EXTERNC N_NOINLINE(void, stdlib_locksDatInit000)(void) {
static TNimNode T_05xOtLU9bCAYnon4m09bcBlg_0[2];
NTI_9bK5SEAqe27K49aDtonge9aQg.size = sizeof(pthread_cond_t);
NTI_9bK5SEAqe27K49aDtonge9aQg.kind = 18;
NTI_9bK5SEAqe27K49aDtonge9aQg.base = 0;
NTI_9bK5SEAqe27K49aDtonge9aQg.flags = 3;
T_05xOtLU9bCAYnon4m09bcBlg_0[0].len = 0; T_05xOtLU9bCAYnon4m09bcBlg_0[0].kind = 2;
NTI_9bK5SEAqe27K49aDtonge9aQg.node = &T_05xOtLU9bCAYnon4m09bcBlg_0[0];
NTI_lsB6JckQ3csMuiRW476VWg.size = sizeof(pthread_mutex_t);
NTI_lsB6JckQ3csMuiRW476VWg.kind = 18;
NTI_lsB6JckQ3csMuiRW476VWg.base = 0;
NTI_lsB6JckQ3csMuiRW476VWg.flags = 3;
T_05xOtLU9bCAYnon4m09bcBlg_0[1].len = 0; T_05xOtLU9bCAYnon4m09bcBlg_0[1].kind = 2;
NTI_lsB6JckQ3csMuiRW476VWg.node = &T_05xOtLU9bCAYnon4m09bcBlg_0[1];
}

