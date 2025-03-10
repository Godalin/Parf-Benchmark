/* 
Geometric Series
computes x=(z-1)* sum(z^k)[k=0..k-1] , y = z^k
returns 1+x-y == 0
*/


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'geo1-ll.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]geo1-ll.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "geo1-ll.c", 9, "reach_error");
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

void func_to_recursive_line_30_to_38_0(int *z, unsigned long long *y, int *k, unsigned long long *x, unsigned long long *c)
{
  if (1)
  {
    {
      __VERIFIER_assert((((((*x) * (*z)) - (*x)) - (*y)) + 1) == 0);
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
    func_to_recursive_line_30_to_38_0(z, y, k, x, c);
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
  assume_abort_if_not(z >= 1);
  assume_abort_if_not(k >= 1);
  x = 1;
  y = z;
  c = 1;
  func_to_recursive_line_30_to_38_0(&z, &y, &k, &x, &c);
  x = x * (z - 1);
  __VERIFIER_assert(((1 + x) - y) == 0);
  return 0;
}

