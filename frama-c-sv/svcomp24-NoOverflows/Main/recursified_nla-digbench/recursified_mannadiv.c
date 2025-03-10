/* 
 Division algorithm from
 "Z. Manna, Mathematical Theory of Computation, McGraw-Hill, 1974"
 return x1 // x2
*/


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'mannadiv.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]mannadiv.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "mannadiv.c", 9, "reach_error");
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

void func_to_recursive_line_31_to_42_0(int *y2, int *x1, int *x2, int *y1, int *y3)
{
  if (1)
  {
    {
      __VERIFIER_assert(((((*y1) * (*x2)) + (*y2)) + (*y3)) == (*x1));
      if (!((*y3) != 0))
      {
        return;
      }
      else
      {
      }
      if (((*y2) + 1) == (*x2))
      {
        *y1 = (*y1) + 1;
        *y2 = 0;
        *y3 = (*y3) - 1;
      }
      else
      {
        *y2 = (*y2) + 1;
        *y3 = (*y3) - 1;
      }
    }
    func_to_recursive_line_31_to_42_0(y2, x1, x2, y1, y3);
  }
  else
  {
  }
}

int main()
{
  int x1;
  int x2;
  int y1;
  int y2;
  int y3;
  x1 = __VERIFIER_nondet_int();
  x2 = __VERIFIER_nondet_int();
  assume_abort_if_not(x1 >= 0);
  assume_abort_if_not(x2 != 0);
  y1 = 0;
  y2 = 0;
  y3 = x1;
  func_to_recursive_line_31_to_42_0(&y2, &x1, &x2, &y1, &y3);
  __VERIFIER_assert(((y1 * x2) + y2) == x1);
  return 0;
}

