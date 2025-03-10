/*
Printing consecutive cubes, by Cohen
http://www.cs.upc.edu/~erodri/webpage/polynomial_invariants/cohencu.htm
*/


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'cohencu-ll.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]cohencu-ll.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "cohencu-ll.c", 8, "reach_error");
}

extern unsigned short __VERIFIER_nondet_ushort(void);
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

void func_to_recursive_line_29_to_41_0(short *a, long long *y, long long *n, long long *z, long long *x)
{
  if (1)
  {
    {
      __VERIFIER_assert((*z) == ((6 * (*n)) + 6));
      __VERIFIER_assert((*y) == ((((3 * (*n)) * (*n)) + (3 * (*n))) + 1));
      __VERIFIER_assert((*x) == (((*n) * (*n)) * (*n)));
      __VERIFIER_assert(((((((*y) * (*z)) - (18 * (*x))) - (12 * (*y))) + (2 * (*z))) - 6) == 0);
      __VERIFIER_assert((((((*z) * (*z)) - (12 * (*y))) - (6 * (*z))) + 12) == 0);
      if (!((*n) <= (*a)))
      {
        return;
      }
      else
      {
      }
      *n = (*n) + 1;
      *x = (*x) + (*y);
      *y = (*y) + (*z);
      *z = (*z) + 6;
    }
    func_to_recursive_line_29_to_41_0(a, y, n, z, x);
  }
  else
  {
  }
}

int main()
{
  short a;
  long long n;
  long long x;
  long long y;
  long long z;
  a = __VERIFIER_nondet_ushort();
  n = 0;
  x = 0;
  y = 1;
  z = 6;
  func_to_recursive_line_29_to_41_0(&a, &y, &n, &z, &x);
  __VERIFIER_assert(z == ((6 * n) + 6));
  __VERIFIER_assert(((((6 * a) * x) - (x * z)) + (12 * x)) == 0);
  __VERIFIER_assert((((((a * z) - (6 * a)) - (2 * y)) + (2 * z)) - 10) == 0);
  __VERIFIER_assert((((((((2 * y) * y) - ((3 * x) * z)) - (18 * x)) - (10 * y)) + (3 * z)) - 10) == 0);
  __VERIFIER_assert(((((z * z) - (12 * y)) - (6 * z)) + 12) == 0);
  __VERIFIER_assert((((((y * z) - (18 * x)) - (12 * y)) + (2 * z)) - 6) == 0);
  return 0;
}

