// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2019 Dirk Beyer and Matthias Dangl
//
// SPDX-License-Identifier: Apache-2.0

// It was automatically generated from 'bin-suffix-5.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]bin-suffix-5.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "bin-suffix-5.c", 3, "reach_error");
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
      *x += 8;
    }
    func_to_recursive_line_13_to_14_0(x);
  }
  else
  {
  }
}

int main(void)
{
  unsigned int x = 5;
  func_to_recursive_line_13_to_14_0(&x);
  __VERIFIER_assert((x & 5) == 5);
  return 0;
}

