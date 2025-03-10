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

// It was automatically generated from 'deep-nested.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]deep-nested.c -o . --pretty_names --trace for2while:1 for2while:1 for2while:1 for2while:1 to_recursive:3 to_recursive:0 to_recursive:1 to_recursive:0 for2while:0 to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "deep-nested.c", 2, "reach_error");
}

void func_to_recursive_line_14_to_16_0(unsigned *uint32_max, unsigned *c, unsigned *b, unsigned *a, unsigned *e, unsigned *d)
{
  if ((*e) < ((*uint32_max) - 1))
  {
    {
      {
        if ((((((*a) == (*b)) && ((*b) == (*c))) && ((*c) == (*d))) && ((*d) == (*e))) && ((*e) == ((*uint32_max) - 2)))
        {
          {
            reach_error();
          }
        }
        else
        {
        }
      }
      ++(*e);
    }
    func_to_recursive_line_14_to_16_0(uint32_max, c, b, a, e, d);
  }
  else
  {
  }
}

void func_to_recursive_line_13_to_14_0(unsigned *uint32_max, unsigned *c, unsigned *b, unsigned *a, unsigned *e, unsigned *d)
{
  if ((*d) < ((*uint32_max) - 1))
  {
    {
      {
        {
          *e = 0;
          func_to_recursive_line_14_to_16_0(&(*uint32_max), &(*c), &(*b), &(*a), &(*e), &(*d));
        }
      }
      ++(*d);
    }
    func_to_recursive_line_13_to_14_0(uint32_max, c, b, a, e, d);
  }
  else
  {
  }
}

void func_to_recursive_line_12_to_13_0(unsigned *uint32_max, unsigned *c, unsigned *b, unsigned *a, unsigned *e, unsigned *d)
{
  if ((*c) < ((*uint32_max) - 1))
  {
    {
      {
        {
          *d = 0;
          func_to_recursive_line_13_to_14_0(&(*uint32_max), &(*c), &(*b), &(*a), &(*e), &(*d));
        }
      }
      ++(*c);
    }
    func_to_recursive_line_12_to_13_0(uint32_max, c, b, a, e, d);
  }
  else
  {
  }
}

void func_to_recursive_line_11_to_12_0(unsigned *uint32_max, unsigned *c, unsigned *b, unsigned *a, unsigned *e, unsigned *d)
{
  if ((*b) < ((*uint32_max) - 1))
  {
    {
      {
        {
          *c = 0;
          func_to_recursive_line_12_to_13_0(&(*uint32_max), &(*c), &(*b), &(*a), &(*e), &(*d));
        }
      }
      ++(*b);
    }
    func_to_recursive_line_11_to_12_0(uint32_max, c, b, a, e, d);
  }
  else
  {
  }
}

void func_to_recursive_line_10_to_11_0(unsigned *uint32_max, unsigned *c, unsigned *b, unsigned *a, unsigned *e, unsigned *d)
{
  if ((*a) < ((*uint32_max) - 1))
  {
    {
      {
        {
          *b = 0;
          func_to_recursive_line_11_to_12_0(&(*uint32_max), &(*c), &(*b), &(*a), &(*e), &(*d));
        }
      }
      ++(*a);
    }
    func_to_recursive_line_10_to_11_0(uint32_max, c, b, a, e, d);
  }
  else
  {
  }
}

int main()
{
  unsigned a;
  unsigned b;
  unsigned c;
  unsigned d;
  unsigned e;
  unsigned uint32_max;
  uint32_max = 0xffffffff;
  {
    a = 0;
    func_to_recursive_line_10_to_11_0(&uint32_max, &c, &b, &a, &e, &d);
  }
  return 0;
}

