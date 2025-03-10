// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2023 Jérôme Boillot <jerome.boillot@ens.fr>
//
// SPDX-License-Identifier: Apache-2.0
//
// We assume sizeof(int)=4.
//
// Corresponds to Figure 1 of "Symbolic transformation of expressions in modular arithmetic"

#include <assert.h>

extern void abort(void);
void reach_error() { assert(0); }
void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: {reach_error();abort();} } }

extern int __VERIFIER_nondet_int();

int main() {
	int x = __VERIFIER_nondet_int();
	int y = __VERIFIER_nondet_int();
	
	if (x < y) abort();

	__VERIFIER_assert((unsigned int) x - y == (long long) x - y);
	return 0;
}
