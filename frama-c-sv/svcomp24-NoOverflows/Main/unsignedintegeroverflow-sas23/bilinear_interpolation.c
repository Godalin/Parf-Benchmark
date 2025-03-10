// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2023 Jérôme Boillot <jerome.boillot@ens.fr>
//
// SPDX-License-Identifier: Apache-2.0
//
// We assume sizeof(int)=4.
//
// Corresponds to 8 nested linear interpolations like the one in `linear_interpolation.c`

#include <assert.h>

extern void abort(void);
void reach_error() { assert(0); }
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

	// z00+z01+z10+z11 can be greater than the maximum element of unsigned int
	long long r =
		((unsigned int) x1-x) * ((unsigned long long) ((unsigned int) y1-y) * z00 / ((unsigned int) y1-y0)) / ((unsigned int) x1-x0) +
		((unsigned int) x-x0) * ((unsigned long long) ((unsigned int) y1-y) * z01 / ((unsigned int) y1-y0)) / ((unsigned int) x1-x0) +
		((unsigned int) x1-x) * ((unsigned long long) ((unsigned int) y-y0) * z10 / ((unsigned int) y1-y0)) / ((unsigned int) x1-x0) +
		((unsigned int) x-x0) * ((unsigned long long) ((unsigned int) y-y0) * z11 / ((unsigned int) y1-y0)) / ((unsigned int) x1-x0);
	
	__VERIFIER_assert(0 <= r && r <= (long long) z00+z01+z10+z11);
	return 0;
}

