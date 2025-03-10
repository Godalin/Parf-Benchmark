// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2023 Jérôme Boillot <jerome.boillot@ens.fr>
//
// SPDX-License-Identifier: Apache-2.0
//
// We assume sizeof(int)=4.
//
// Corresponds to Figure 10 of "Symbolic transformation of expressions in modular arithmetic"
// with the extra case `b < 0`.

#include <assert.h>

extern void abort(void);
void reach_error() { assert(0); }
void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: {reach_error();abort();} } }

extern int __VERIFIER_nondet_int();

int main() {
	int x = __VERIFIER_nondet_int();
	int a = __VERIFIER_nondet_int();
	int b = __VERIFIER_nondet_int();

	if (x < a) abort();
	if ((unsigned int) x-a > 256) abort();
	// 0 <= x-a <= 256
	int r = (long long) (x-a) * b / 256;
	
	if (b >= 0) {
		__VERIFIER_assert(0 <= r && r <= b);
	} else {
		__VERIFIER_assert(b <= r && r <= 0);
	}
	return 0;
}

