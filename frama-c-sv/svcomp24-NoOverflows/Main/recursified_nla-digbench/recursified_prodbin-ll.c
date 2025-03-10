/* shift_add algorithm for computing the 
   product of two natural numbers
*/

// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'prodbin-ll.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]prodbin-ll.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "prodbin-ll.c", 6, "reach_error");
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

void func_to_recursive_line_0_to_40_0(int *b, long long *x, long long *y, int *a, long long *z)
{
  if (1)
  {
    {
      __VERIFIER_assert(((*z) + ((*x) * (*y))) == (((long long) (*a)) * (*b)));
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
    func_to_recursive_line_0_to_40_0(b, x, y, a, z);
  }
  else
  {
  }
}

int main()
{
  int a;
  int b;
  long long x;
  long long y;
  long long z;
  a = __VERIFIER_nondet_int();
  b = __VERIFIER_nondet_int();
  assume_abort_if_not(b >= 1);
  x = a;
  y = b;
  z = 0;
  func_to_recursive_line_0_to_40_0(&b, &x, &y, &a, &z);
  __VERIFIER_assert(z == (((long long) a) * b));
  return 0;
}

