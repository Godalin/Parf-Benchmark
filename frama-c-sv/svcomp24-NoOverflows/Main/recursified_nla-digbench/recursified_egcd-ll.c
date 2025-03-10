/* extended Euclid's algorithm */

// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'egcd-ll.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]egcd-ll.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "egcd-ll.c", 4, "reach_error");
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

void func_to_recursive_line_33_to_48_0(long long *r, long long *q, long long *a, long long *s, long long *b, int *y, int *x, long long *p)
{
  if (1)
  {
    {
      __VERIFIER_assert(1 == (((*p) * (*s)) - ((*r) * (*q))));
      __VERIFIER_assert((*a) == (((*y) * (*r)) + ((*x) * (*p))));
      __VERIFIER_assert((*b) == (((*x) * (*q)) + ((*y) * (*s))));
      if (!((*a) != (*b)))
      {
        return;
      }
      else
      {
      }
      if ((*a) > (*b))
      {
        *a = (*a) - (*b);
        *p = (*p) - (*q);
        *r = (*r) - (*s);
      }
      else
      {
        *b = (*b) - (*a);
        *q = (*q) - (*p);
        *s = (*s) - (*r);
      }
    }
    func_to_recursive_line_33_to_48_0(r, q, a, s, b, y, x, p);
  }
  else
  {
  }
}

int main()
{
  long long a;
  long long b;
  long long p;
  long long q;
  long long r;
  long long s;
  int x;
  int y;
  x = __VERIFIER_nondet_int();
  y = __VERIFIER_nondet_int();
  assume_abort_if_not(x >= 1);
  assume_abort_if_not(y >= 1);
  a = x;
  b = y;
  p = 1;
  q = 0;
  r = 0;
  s = 1;
  func_to_recursive_line_33_to_48_0(&r, &q, &a, &s, &b, &y, &x, &p);
  __VERIFIER_assert((a - b) == 0);
  __VERIFIER_assert((((p * x) + (r * y)) - b) == 0);
  __VERIFIER_assert((((q * r) - (p * s)) + 1) == 0);
  __VERIFIER_assert((((q * x) + (s * y)) - b) == 0);
  return 0;
}

