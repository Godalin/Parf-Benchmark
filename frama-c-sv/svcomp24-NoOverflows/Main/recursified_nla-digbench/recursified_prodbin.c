/* shift_add algorithm for computing the 
   product of two natural numbers
*/

// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'prodbin.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]prodbin.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "prodbin.c", 6, "reach_error");
}

extern double __VERIFIER_nondet_double(void);
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

void func_to_recursive_line_30_to_40_0(int *a, int *b, int *z, int *x, int *y)
{
  if (1)
  {
    {
      __VERIFIER_assert(((*z) + ((*x) * (*y))) == ((*a) * (*b)));
      if (!((*y) != 0))
      {
        return;
      }
      else
      {
      }
      if (((*y) % 2) == 1)
      {
        *z = (*z) + (*x);
        *y = (*y) - 1;
      }
      else
      {
      }
      *x = 2 * (*x);
      *y = (*y) / 2;
    }
    func_to_recursive_line_30_to_40_0(a, b, z, x, y);
  }
  else
  {
  }
}

int main()
{
  int a;
  int b;
  int x;
  int y;
  int z;
  a = __VERIFIER_nondet_double();
  b = __VERIFIER_nondet_double();
  assume_abort_if_not(b >= 1);
  x = a;
  y = b;
  z = 0;
  func_to_recursive_line_30_to_40_0(&a, &b, &z, &x, &y);
  __VERIFIER_assert(z == (a * b));
  return 0;
}

