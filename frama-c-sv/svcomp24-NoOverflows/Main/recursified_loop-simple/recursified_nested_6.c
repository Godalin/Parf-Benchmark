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

// It was automatically generated from 'nested_6.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]nested_6.c -o . --pretty_names --trace for2while:1 for2while:4 for2while:3 for2while:2 for2while:1 for2while:0 to_recursive:4 to_recursive:0 to_recursive:2 to_recursive:2
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "nested_6.c", 13, "reach_error");
}

void func_to_recursive_line_28_to_28_0(int *f)
{
  if ((*f) < 6)
  {
    {
      {
      }
      ++(*f);
    }
    func_to_recursive_line_28_to_28_0(f);
  }
  else
  {
  }
}

void func_to_recursive_line_27_to_28_0(int *e, int *f)
{
  if ((*e) < 6)
  {
    {
      {
        {
          *f = 0;
          func_to_recursive_line_28_to_28_0(&(*f));
        }
      }
      ++(*e);
    }
    func_to_recursive_line_27_to_28_0(e, f);
  }
  else
  {
  }
}

void func_to_recursive_line_26_to_27_0(int *d, int *e, int *f)
{
  if ((*d) < 6)
  {
    {
      {
        {
          *e = 0;
          func_to_recursive_line_27_to_28_0(&(*e), &(*f));
        }
      }
      ++(*d);
    }
    func_to_recursive_line_26_to_27_0(d, e, f);
  }
  else
  {
  }
}

void func_to_recursive_line_25_to_26_0(int *d, int *c, int *e, int *f)
{
  if ((*c) < 6)
  {
    {
      {
        {
          *d = 0;
          func_to_recursive_line_26_to_27_0(&(*d), &(*e), &(*f));
        }
      }
      ++(*c);
    }
    func_to_recursive_line_25_to_26_0(d, c, e, f);
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
  int e = 6;
  int f = 6;
  {
    a = 0;
    while (a < 6)
    {
      {
        {
          b = 0;
          while (b < 6)
          {
            {
              {
                c = 0;
                func_to_recursive_line_25_to_26_0(&d, &c, &e, &f);
              }
            }
            ++b;
          }

        }
      }
      ++a;
    }

  }
  if (!((((((a == 6) && (b == 6)) && (c == 6)) && (d == 6)) && (e == 6)) && (f == 6)))
  {
    reach_error();
  }
  else
  {
  }
  return 1;
}

