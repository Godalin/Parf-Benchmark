// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2012-2021 The SV-Benchmarks Community
// SPDX-FileCopyrightText: 2012 FBK-ES <https://es.fbk.eu/>
//
// SPDX-License-Identifier: Apache-2.0

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "num_conversion_2.c", 3, "reach_error"); }

extern unsigned char __VERIFIER_nondet_uchar(void);
void __VERIFIER_assert(int cond) {
  if (!(cond)) {
    ERROR: {reach_error();abort();}
  }
  return;
}
//#include <assert.h>

int main()
{
    unsigned char x = __VERIFIER_nondet_uchar();
    unsigned char y;
    unsigned char c;

    y = 0;
    c = 0;
    while (c < (unsigned char)8) {
        unsigned char i = ((unsigned char)1) << c;
        unsigned char bit = x & i;
        if (bit != (unsigned char)0) {
            y = y + i;
        }
        c = c + ((unsigned char)1);
    }
    __VERIFIER_assert(x == y);
    
    return 0;
}
