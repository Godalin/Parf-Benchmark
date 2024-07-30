// This file is part of frama-c-svcomp,
// a wrapper around Frama-C that makes it possible
// to execute Frama-C as part of the Competition on Software Verification:
// https://gitlab.com/sosy-lab/software/frama-c-svcomp
//
// SPDX-FileCopyrightText: 2020 Dirk Beyer <https://www.sosy-lab.org>
//
// SPDX-License-Identifier: Apache-2.0

#include "alloca.h"
#include "limits.h"
#include "math.h"
#include "string.h"
//#include <limits.h>
#include "__fc_builtin.h"
#include "__fc_gcc_builtins.h"
//#include "stdlib.h"

int __VERIFIER_nondet_int(void) {
  return Frama_C_interval(INT_MIN, INT_MAX);
}
unsigned int __VERIFIER_nondet_uint(void) {
  return Frama_C_unsigned_int_interval(0,UINT_MAX);
}

unsigned char __VERIFIER_nondet_uchar(void) {
    return (unsigned char) Frama_C_unsigned_int_interval(0,UCHAR_MAX);
}
char __VERIFIER_nondet_char(void) {
    return (char) __VERIFIER_nondet_uchar();
}

_Bool __VERIFIER_nondet_bool(void) {
  return (_Bool) __VERIFIER_nondet_int();                      
}

long __VERIFIER_nondet_long(void) {
  return Frama_C_long_interval(LONG_MIN, LONG_MAX);
}

unsigned long __VERIFIER_nondet_ulong(void) {
  return Frama_C_unsigned_long_interval(0,ULONG_MAX);
}

void *__builtin_alloca(size_t size) {
  void * result = 0;
  while (!result) {
    alloca(size);
  }
  return result;
}

double __builtin_huge_val(void) {
  return (double) __fc_infinity(0);
}

float __builtin_huge_valf(void) {
  return __fc_infinity(0);
}

float __builtin_inff(void) {
  return __fc_infinity(0);
}

// Should probably return double but there is no cast for NAN in frama-c's math.h
float __builtin_nan(const char *str) {
  return __fc_nan(0);
}

float __builtin_nanf(const char *str) {
  return __fc_nan(0);
}

void *__builtin_memcpy(void *dest, const void *src, size_t n) {
  return memcpy(dest, src, n);
}

void *__builtin_memset(void *s, int c, size_t n) {
  return memset(s, c, n);
}

void *__builtin_memmove(void *dest, const void *src, size_t n) {
  return memmove(dest, src, n);
}
