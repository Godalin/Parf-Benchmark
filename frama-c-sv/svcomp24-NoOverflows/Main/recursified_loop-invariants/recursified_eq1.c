// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2019 Dirk Beyer and Matthias Dangl
//
// SPDX-License-Identifier: Apache-2.0

// It was automatically generated from 'eq1.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]eq1.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "eq1.c", 3, "reach_error");
}

extern unsigned int __VERIFIER_nondet_uint(void);
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

void func_to_recursive_line_16_to_20_0(unsigned int *x, unsigned int *w, unsigned int *y, unsigned int *z)
{
  if (__VERIFIER_nondet_uint())
  {
    {
      if (__VERIFIER_nondet_uint())
      {
        ++(*w);
        ++(*x);
      }
      else
      {
        --(*y);
        --(*z);
      }
    }
    func_to_recursive_line_16_to_20_0(x, w, y, z);
  }
  else
  {
  }
}

int main(void)
{
  unsigned int w = __VERIFIER_nondet_uint();
  unsigned int x = w;
  unsigned int y = __VERIFIER_nondet_uint();
  unsigned int z = y;
  func_to_recursive_line_16_to_20_0(&x, &w, &y, &z);
  __VERIFIER_assert((w == x) && (y == z));
  return 0;
}

