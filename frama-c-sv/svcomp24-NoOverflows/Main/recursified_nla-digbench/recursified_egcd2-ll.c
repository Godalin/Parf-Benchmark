/* extended Euclid's algorithm */

// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'egcd2-ll.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]egcd2-ll.c -o . --pretty_names --trace to_recursive:0 to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "egcd2-ll.c", 4, "reach_error");
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

void func_to_recursive_line_45_to_53_0(long long *c, long long *yy, int *y, long long *s, long long *k, int *x, long long *q, long long *b, long long *r, long long *a, long long *p, long long *xy)
{
  if (1)
  {
    {
      __VERIFIER_assert((*a) == (((*k) * (*b)) + (*c)));
      __VERIFIER_assert((*a) == (((*y) * (*r)) + ((*x) * (*p))));
      __VERIFIER_assert((*b) == (((*x) * (*q)) + ((*y) * (*s))));
      __VERIFIER_assert((((((((*q) * (*xy)) + ((*s) * (*yy))) - ((*q) * (*x))) - ((*b) * (*y))) - ((*s) * (*y))) + (*b)) == 0);
      if (!((*c) >= (*b)))
      {
        return;
      }
      else
      {
      }
      *c = (*c) - (*b);
      *k = (*k) + 1;
    }
    func_to_recursive_line_45_to_53_0(c, yy, y, s, k, x, q, b, r, a, p, xy);
  }
  else
  {
  }
}

void func_to_recursive_line_39_to_65_0(long long *c, long long *yy, int *y, long long *s, long long *k, int *x, long long *q, long long *b, long long *r, long long *a, long long *p, long long *xy)
{
  if (1)
  {
    {
      if (!((*b) != 0))
      {
        return;
      }
      else
      {
      }
      *c = *a;
      *k = 0;
      func_to_recursive_line_45_to_53_0(&(*c), &(*yy), &(*y), &(*s), &(*k), &(*x), &(*q), &(*b), &(*r), &(*a), &(*p), &(*xy));
      *a = *b;
      *b = *c;
      long long temp;
      temp = *p;
      *p = *q;
      *q = temp - ((*q) * (*k));
      temp = *r;
      *r = *s;
      *s = temp - ((*s) * (*k));
    }
    func_to_recursive_line_39_to_65_0(c, yy, y, s, k, x, q, b, r, a, p, xy);
  }
  else
  {
  }
}

int main()
{
  int x;
  int y;
  long long a;
  long long b;
  long long p;
  long long q;
  long long r;
  long long s;
  long long c;
  long long k;
  long long xy;
  long long yy;
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
  c = 0;
  k = 0;
  xy = ((long long) x) * y;
  yy = ((long long) y) * y;
  assume_abort_if_not(xy < 2147483647);
  assume_abort_if_not(yy < 2147483647);
  func_to_recursive_line_39_to_65_0(&c, &yy, &y, &s, &k, &x, &q, &b, &r, &a, &p, &xy);
  __VERIFIER_assert(((q * x) + (s * y)) == 0);
  __VERIFIER_assert(((p * x) + (r * y)) == a);
  return a;
}

