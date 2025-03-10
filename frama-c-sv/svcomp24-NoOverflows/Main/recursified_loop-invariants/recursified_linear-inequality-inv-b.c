// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2019 Dirk Beyer and Matthias Dangl
//
// SPDX-License-Identifier: Apache-2.0

// It was automatically generated from 'linear-inequality-inv-b.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]linear-inequality-inv-b.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "linear-inequality-inv-b.c", 2, "reach_error");
}

extern unsigned char __VERIFIER_nondet_uchar(void);
void func_to_recursive_line_12_to_15_0(unsigned char *v, unsigned char *n, unsigned char *s, unsigned int *i)
{
  if ((*i) < (*n))
  {
    {
      *v = __VERIFIER_nondet_uchar();
      *s += *v;
      ++(*i);
    }
    func_to_recursive_line_12_to_15_0(v, n, s, i);
  }
  else
  {
  }
}

int main()
{
  unsigned char n = __VERIFIER_nondet_uchar();
  if (n == 0)
  {
    return 0;
  }
  else
  {
  }
  unsigned char v = 0;
  unsigned char s = 0;
  unsigned int i = 0;
  func_to_recursive_line_12_to_15_0(&v, &n, &s, &i);
  if (s < v)
  {
    reach_error();
    return 1;
  }
  else
  {
  }
  if (s > 65025)
  {
    reach_error();
    return 1;
  }
  else
  {
  }
  return 0;
}

