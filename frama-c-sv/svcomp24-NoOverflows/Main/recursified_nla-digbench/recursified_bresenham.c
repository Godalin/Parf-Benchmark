/*
  Bresenham's line drawing algorithm 
  from Srivastava et al.'s paper From Program Verification to Program Synthesis in POPL '10 
*/

// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'bresenham.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]bresenham.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "bresenham.c", 7, "reach_error");
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

void func_to_recursive_line_27_to_39_0(int *X, int *x, int *Y, int *y, int *v)
{
  if (1)
  {
    {
      __VERIFIER_assert(((((((2 * (*Y)) * (*x)) - ((2 * (*X)) * (*y))) - (*X)) + (2 * (*Y))) - (*v)) == 0);
      if (!((*x) <= (*X)))
      {
        return;
      }
      else
      {
      }
      if ((*v) < 0)
      {
        *v = (*v) + (2 * (*Y));
      }
      else
      {
        *v = (*v) + (2 * ((*Y) - (*X)));
        (*y)++;
      }
      (*x)++;
    }
    func_to_recursive_line_27_to_39_0(X, x, Y, y, v);
  }
  else
  {
  }
}

int main()
{
  int X;
  int Y;
  int v;
  int x;
  int y;
  X = __VERIFIER_nondet_int();
  Y = __VERIFIER_nondet_int();
  v = (2 * Y) - X;
  y = 0;
  x = 0;
  func_to_recursive_line_27_to_39_0(&X, &x, &Y, &y, &v);
  __VERIFIER_assert((((((((2 * Y) * x) - ((2 * x) * y)) - X) + (2 * Y)) - v) + (2 * y)) == 0);
  return 0;
}

