/*
  Cohen's integer division
  returns x % y
  http://www.cs.upc.edu/~erodri/webpage/polynomial_invariants/cohendiv.htm
*/

// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'cohendiv-ll.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]cohendiv-ll.c -o . --pretty_names --trace to_recursive:0 to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "cohendiv-ll.c", 8, "reach_error");
}

extern int __VERIFIER_nondet_int(void);
extern void abort(void);
void assume_abort_if_not(int cond)
{
  if (!cond)
  {
    abort();
  }
  else
  {
  }
}

void __VERIFIER_assert(int cond)
{
  if (!cond)
  {
    ERROR:
    {
      reach_error();
    }

  }
  else
  {
  }
  return;
}

void func_to_recursive_line_41_to_52_0(int *x, long long *r, int *y, long long *q, long long *a, long long *b)
{
  if (1)
  {
    {
      __VERIFIER_assert((*b) == ((*y) * (*a)));
      __VERIFIER_assert((*x) == (((*q) * (*y)) + (*r)));
      __VERIFIER_assert((*r) >= 0);
      if (!((*r) >= (2 * (*b))))
      {
        return;
      }
      else
      {
      }
      __VERIFIER_assert((*r) >= ((2 * (*y)) * (*a)));
      *a = 2 * (*a);
      *b = 2 * (*b);
    }
    func_to_recursive_line_41_to_52_0(x, r, y, q, a, b);
  }
  else
  {
  }
}

void func_to_recursive_line_32_to_55_0(int *x, long long *r, int *y, long long *q, long long *a, long long *b)
{
  if (1)
  {
    {
      __VERIFIER_assert((*b) == ((*y) * (*a)));
      __VERIFIER_assert((*x) == (((*q) * (*y)) + (*r)));
      if (!((*r) >= (*y)))
      {
        return;
      }
      else
      {
      }
      *a = 1;
      *b = *y;
      func_to_recursive_line_41_to_52_0(&(*x), &(*r), &(*y), &(*q), &(*a), &(*b));
      *r = (*r) - (*b);
      *q = (*q) + (*a);
    }
    func_to_recursive_line_32_to_55_0(x, r, y, q, a, b);
  }
  else
  {
  }
}

int main()
{
  int x;
  int y;
  long long q;
  long long r;
  long long a;
  long long b;
  x = __VERIFIER_nondet_int();
  y = __VERIFIER_nondet_int();
  assume_abort_if_not(y >= 1);
  q = 0;
  r = x;
  a = 0;
  b = 0;
  func_to_recursive_line_32_to_55_0(&x, &r, &y, &q, &a, &b);
  __VERIFIER_assert(x == ((q * y) + r));
  return 0;
}

