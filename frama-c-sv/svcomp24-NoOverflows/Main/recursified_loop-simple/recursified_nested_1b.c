// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// This file was part of CPAchecker,
// a tool for configurable software verification:
// https://cpachecker.sosy-lab.org
//
// SPDX-FileCopyrightText: 2007-2020 Dirk Beyer <https://www.sosy-lab.org>
//
// SPDX-License-Identifier: Apache-2.0

// It was automatically generated from 'nested_1b.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]nested_1b.c -o . --pretty_names --trace for2while:0 to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "nested_1b.c", 13, "reach_error");
}

void func_to_recursive_line_19_to_19_0(int *a)
{
  if ((*a) < 6)
  {
    {
      {
      }
      ++(*a);
    }
    func_to_recursive_line_19_to_19_0(a);
  }
  else
  {
  }
}

int main()
{
  int a = 6;
  {
    a = 0;
    func_to_recursive_line_19_to_19_0(&a);
  }
  if (a == 6)
  {
    reach_error();
  }
  else
  {
  }
  return 1;
}

