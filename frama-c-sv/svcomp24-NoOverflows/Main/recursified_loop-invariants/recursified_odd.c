// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2019 Dirk Beyer and Matthias Dangl
//
// SPDX-License-Identifier: Apache-2.0

// It was automatically generated from 'odd.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]odd.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "odd.c", 3, "reach_error");
}

extern int __VERIFIER_nondet_int();
void __VERIFIER_assert(int cond)
{
  if (!cond)
  {
    ERROR:
    {
      reach_error();
      abort();
    }

  }
  else
  {
  }
  return;
}

void func_to_recursive_line_13_to_14_0(unsigned int *x)
{
  if (__VERIFIER_nondet_int())
  {
    {
      *x += 2;
    }
    func_to_recursive_line_13_to_14_0(x);
  }
  else
  {
  }
}

int main(void)
{
  unsigned int x = 1;
  func_to_recursive_line_13_to_14_0(&x);
  __VERIFIER_assert(x % 2);
  return 0;
}

