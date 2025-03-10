/* algorithm for computing the product of two natural numbers */


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'prod4br.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]prod4br.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "prod4br.c", 5, "reach_error");
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

void func_to_recursive_line_32_to_51_0(int *a, int *b, int *y, int *x, int *q, int *p)
{
  if (1)
  {
    {
      __VERIFIER_assert(((*q) + (((*a) * (*b)) * (*p))) == ((*x) * (*y)));
      if (!(((*a) != 0) && ((*b) != 0)))
      {
        return;
      }
      else
      {
      }
      if ((((*a) % 2) == 0) && (((*b) % 2) == 0))
      {
        *a = (*a) / 2;
        *b = (*b) / 2;
        *p = 4 * (*p);
      }
      else
      {
        if ((((*a) % 2) == 1) && (((*b) % 2) == 0))
        {
          *a = (*a) - 1;
          *q = (*q) + ((*b) * (*p));
        }
        else
        {
          if ((((*a) % 2) == 0) && (((*b) % 2) == 1))
          {
            *b = (*b) - 1;
            *q = (*q) + ((*a) * (*p));
          }
          else
          {
            *a = (*a) - 1;
            *b = (*b) - 1;
            *q = (*q) + ((((*a) + (*b)) + 1) * (*p));
          }
        }
      }
    }
    func_to_recursive_line_32_to_51_0(a, b, y, x, q, p);
  }
  else
  {
  }
}

int main()
{
  int x;
  int y;
  int a;
  int b;
  int p;
  int q;
  x = __VERIFIER_nondet_int();
  y = __VERIFIER_nondet_int();
  assume_abort_if_not(y >= 1);
  a = x;
  b = y;
  p = 1;
  q = 0;
  func_to_recursive_line_32_to_51_0(&a, &b, &y, &x, &q, &p);
  __VERIFIER_assert(q == (x * y));
  __VERIFIER_assert((a * b) == 0);
  return 0;
}

