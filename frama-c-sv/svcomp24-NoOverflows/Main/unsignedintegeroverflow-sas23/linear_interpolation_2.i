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
void reach_error() { ((void) sizeof ((0) ? 1 : 0), __extension__ ({ if (0) ; else __assert_fail ("0", "linear_interpolation_2.c", 12, __extension__ __PRETTY_FUNCTION__); })); }
void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: {reach_error();abort();} } }
extern int __VERIFIER_nondet_int();
int main() {
 int x = __VERIFIER_nondet_int();
 int a = __VERIFIER_nondet_int();
 int b = __VERIFIER_nondet_int();
 if (x < a) abort();
 if ((unsigned int) x-a > 256) abort();
 int r = (long long) (x-a) * b / 256;
 if (b >= 0) {
  __VERIFIER_assert(0 <= r && r <= b);
 } else {
  __VERIFIER_assert(b <= r && r <= 0);
 }
 return 0;
}
