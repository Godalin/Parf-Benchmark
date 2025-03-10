/* extended Euclid's algorithm */

// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'egcd2.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]egcd2.c -o . --pretty_names --trace to_recursive:0 to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "egcd2.c", 4, "reach_error");
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

void func_to_recursive_line_40_to_48_0(int *s, int *x, int *c, int *k, int *b, int *r, int *q, int *y, int *a, int *p)
{
  if (1)
  {
    {
      __VERIFIER_assert((*a) == (((*k) * (*b)) + (*c)));
      __VERIFIER_assert((*a) == (((*y) * (*r)) + ((*x) * (*p))));
      __VERIFIER_assert((*b) == (((*x) * (*q)) + ((*y) * (*s))));
      __VERIFIER_assert(((((((((*q) * (*x)) * (*y)) + (((*s) * (*y)) * (*y))) - ((*q) * (*x))) - ((*b) * (*y))) - ((*s) * (*y))) + (*b)) == 0);
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
    func_to_recursive_line_40_to_48_0(s, x, c, k, b, r, q, y, a, p);
  }
  else
  {
  }
}

void func_to_recursive_line_34_to_60_0(int *s, int *x, int *c, int *b, int *k, int *r, int *q, int *y, int *a, int *p)
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
      func_to_recursive_line_40_to_48_0(&(*s), &(*x), &(*c), &(*k), &(*b), &(*r), &(*q), &(*y), &(*a), &(*p));
      *a = *b;
      *b = *c;
      int temp;
      temp = *p;
      *p = *q;
      *q = temp - ((*q) * (*k));
      temp = *r;
      *r = *s;
      *s = temp - ((*s) * (*k));
    }
    func_to_recursive_line_34_to_60_0(s, x, c, b, k, r, q, y, a, p);
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
  int r;
  int s;
  int c;
  int k;
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
  func_to_recursive_line_34_to_60_0(&s, &x, &c, &b, &k, &r, &q, &y, &a, &p);
  __VERIFIER_assert(((q * x) + (s * y)) == 0);
  __VERIFIER_assert(((p * x) + (r * y)) == a);
  return a;
}

