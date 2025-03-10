// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2023 Jérôme Boillot <jerome.boillot@ens.fr>
//
// SPDX-License-Identifier: Apache-2.0

extern void __assert_fail (const char *__assertion, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern void __assert_perror_fail (int __errnum, const char *__file,
      unsigned int __line, const char *__function)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
extern void __assert (const char *__assertion, const char *__file, int __line)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));

extern void abort(void);
void reach_error() { ((void) sizeof ((0) ? 1 : 0), __extension__ ({ if (0) ; else __assert_fail ("0", "bilinear_interpolation.c", 11, __extension__ __PRETTY_FUNCTION__); })); }
void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: {reach_error();abort();} } }
extern int __VERIFIER_nondet_int();
int main() {
 int x0 = __VERIFIER_nondet_int();
 int x = __VERIFIER_nondet_int();
 int x1 = __VERIFIER_nondet_int();
 int y0 = __VERIFIER_nondet_int();
 int y = __VERIFIER_nondet_int();
 int y1 = __VERIFIER_nondet_int();
 unsigned int z00 = __VERIFIER_nondet_int();
 unsigned int z01 = __VERIFIER_nondet_int();
 unsigned int z10 = __VERIFIER_nondet_int();
 unsigned int z11 = __VERIFIER_nondet_int();
 if (x0 > x || x > x1 || y0 > y || y > y1 || y0 >= y1 || x0 >= x1) abort();
 long long r =
  ((unsigned int) x1-x) * ((unsigned long long) ((unsigned int) y1-y) * z00 / ((unsigned int) y1-y0)) / ((unsigned int) x1-x0) +
  ((unsigned int) x-x0) * ((unsigned long long) ((unsigned int) y1-y) * z01 / ((unsigned int) y1-y0)) / ((unsigned int) x1-x0) +
  ((unsigned int) x1-x) * ((unsigned long long) ((unsigned int) y-y0) * z10 / ((unsigned int) y1-y0)) / ((unsigned int) x1-x0) +
  ((unsigned int) x-x0) * ((unsigned long long) ((unsigned int) y-y0) * z11 / ((unsigned int) y1-y0)) / ((unsigned int) x1-x0);
 __VERIFIER_assert(0 <= r && r <= (long long) z00+z01+z10+z11);
 return 0;
}
