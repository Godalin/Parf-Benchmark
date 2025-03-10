/* 
Geometric Series
computes x = sum(z^k)[k=0..k-1], y = z^(k-1)
*/


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'geo3-ll.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]geo3-ll.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "geo3-ll.c", 8, "reach_error");
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

void func_to_recursive_line_30_to_38_0(unsigned long long *x, int *z, unsigned long long *c, int *k, unsigned long long *y, int *a, long long *az)
{
  if (1)
  {
    {
      __VERIFIER_assert((((((*z) * (*x)) - (*x)) + (*a)) - ((*az) * (*y))) == 0);
      if (!((*c) < (*k)))
      {
        return;
      }
      else
      {
      }
      *c = (*c) + 1;
      *x = ((*x) * (*z)) + (*a);
      *y = (*y) * (*z);
    }
    func_to_recursive_line_30_to_38_0(x, z, c, k, y, a, az);
  }
  else
  {
  }
}

int main()
{
  int z;
  int a;
  int k;
  unsigned long long x;
  unsigned long long y;
  unsigned long long c;
  long long az;
  z = __VERIFIER_nondet_int();
  a = __VERIFIER_nondet_int();
  k = __VERIFIER_nondet_int();
  x = a;
  y = 1;
  c = 1;
  az = ((long long) a) * z;
  func_to_recursive_line_30_to_38_0(&x, &z, &c, &k, &y, &a, &az);
  __VERIFIER_assert(((((z * x) - x) + a) - (az * y)) == 0);
  return x;
}

