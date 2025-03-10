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

// It was automatically generated from 'nested_4.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]nested_4.c -o . --pretty_names --trace for2while:1 for2while:2 for2while:1 for2while:0 to_recursive:3 to_recursive:0 to_recursive:1 to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "nested_4.c", 13, "reach_error");
}

void func_to_recursive_line_25_to_25_0(int *d)
{
  if ((*d) < 6)
  {
    {
      {
      }
      ++(*d);
    }
    func_to_recursive_line_25_to_25_0(d);
  }
  else
  {
  }
}

void func_to_recursive_line_24_to_25_0(int *d, int *c)
{
  if ((*c) < 6)
  {
    {
      {
        {
          *d = 0;
          func_to_recursive_line_25_to_25_0(&(*d));
        }
      }
      ++(*c);
    }
    func_to_recursive_line_24_to_25_0(d, c);
  }
  else
  {
  }
}

void func_to_recursive_line_23_to_24_0(int *b, int *c, int *d)
{
  if ((*b) < 6)
  {
    {
      {
        {
          *c = 0;
          func_to_recursive_line_24_to_25_0(&(*d), &(*c));
        }
      }
      ++(*b);
    }
    func_to_recursive_line_23_to_24_0(b, c, d);
  }
  else
  {
  }
}

void func_to_recursive_line_22_to_23_0(int *b, int *d, int *c, int *a)
{
  if ((*a) < 6)
  {
    {
      {
        {
          *b = 0;
          func_to_recursive_line_23_to_24_0(&(*b), &(*c), &(*d));
        }
      }
      ++(*a);
    }
    func_to_recursive_line_22_to_23_0(b, d, c, a);
  }
  else
  {
  }
}

int main()
{
  int a = 6;
  int b = 6;
  int c = 6;
  int d = 6;
  {
    a = 0;
    func_to_recursive_line_22_to_23_0(&b, &d, &c, &a);
  }
  if (!((((a == 6) && (b == 6)) && (c == 6)) && (d == 6)))
  {
    reach_error();
  }
  else
  {
  }
  return 1;
}

