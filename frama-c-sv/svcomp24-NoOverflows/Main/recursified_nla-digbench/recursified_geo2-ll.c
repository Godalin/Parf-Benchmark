/* 
Geometric Series
computes x = sum(z^k)[k=0..k-1], y = z^(k-1)
*/


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'geo2-ll.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]geo2-ll.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "geo2-ll.c", 8, "reach_error");
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

void func_to_recursive_line_30_to_38_0(int *k, unsigned long long *c, unsigned long long *x, unsigned long long *y, int *z)
{
  if (1)
  {
    {
      __VERIFIER_assert((((1 + ((*x) * (*z))) - (*x)) - ((*z) * (*y))) == 0);
      if (!((*c) < (*k)))
      {
        return;
      }
      else
      {
      }
      *c = (*c) + 1;
      *x = ((*x) * (*z)) + 1;
      *y = (*y) * (*z);
    }
    func_to_recursive_line_30_to_38_0(k, c, x, y, z);
  }
  else
  {
  }
}

int main()
{
  int z;
  int k;
  unsigned long long x;
  unsigned long long y;
  unsigned long long c;
  z = __VERIFIER_nondet_int();
  k = __VERIFIER_nondet_int();
  x = 1;
  y = 1;
  c = 1;
  func_to_recursive_line_30_to_38_0(&k, &c, &x, &y, &z);
  __VERIFIER_assert((((1 + (x * z)) - x) - (z * y)) == 0);
  return 0;
}

