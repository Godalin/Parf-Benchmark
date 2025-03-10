/*
  Bresenham's line drawing algorithm 
  from Srivastava et al.'s paper From Program Verification to Program Synthesis in POPL '10 
*/

// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'bresenham-ll.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]bresenham-ll.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "bresenham-ll.c", 7, "reach_error");
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

void func_to_recursive_line_0_to_41_0(long long *yx, int *Y, long long *v, long long *y, long long *x, int *X, long long *xy)
{
  if (1)
  {
    {
      *yx = ((long long) (*Y)) * (*x);
      *xy = ((long long) (*X)) * (*y);
      __VERIFIER_assert((((((2 * (*yx)) - (2 * (*xy))) - (*X)) + (((long long) 2) * (*Y))) - (*v)) == 0);
      if (!((*x) <= (*X)))
      {
        return;
      }
      else
      {
      }
      if ((*v) < 0)
      {
        *v = (*v) + (((long long) 2) * (*Y));
      }
      else
      {
        *v = (*v) + (2 * (((long long) (*Y)) - (*X)));
        (*y)++;
      }
      (*x)++;
    }
    func_to_recursive_line_0_to_41_0(yx, Y, v, y, x, X, xy);
  }
  else
  {
  }
}

int main()
{
  int X;
  int Y;
  long long x;
  long long y;
  long long v;
  long long xy;
  long long yx;
  X = __VERIFIER_nondet_int();
  Y = __VERIFIER_nondet_int();
  v = (((long long) 2) * Y) - X;
  y = 0;
  x = 0;
  func_to_recursive_line_0_to_41_0(&yx, &Y, &v, &y, &x, &X, &xy);
  xy = ((long long) x) * y;
  yx = ((long long) Y) * x;
  __VERIFIER_assert(((((((2 * yx) - (2 * xy)) - X) + (((long long) 2) * Y)) - v) + (2 * y)) == 0);
  return 0;
}

