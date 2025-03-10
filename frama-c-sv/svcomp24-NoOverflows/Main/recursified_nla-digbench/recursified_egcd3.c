/* extended Euclid's algorithm */

// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'egcd3.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]egcd3.c -o . --pretty_names --trace to_recursive:0 to_recursive:0 to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "egcd3.c", 4, "reach_error");
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

void func_to_recursive_line_47_to_56_0(int *k, int *d, int *x, int *p, int *r, int *b, int *q, int *s, int *v, int *y, int *a, int *c)
{
  if (1)
  {
    {
      __VERIFIER_assert((*a) == (((*y) * (*r)) + ((*x) * (*p))));
      __VERIFIER_assert((*b) == (((*x) * (*q)) + ((*y) * (*s))));
      __VERIFIER_assert((*a) == (((*k) * (*b)) + (*c)));
      __VERIFIER_assert((*v) == ((*b) * (*d)));
      if (!((*c) >= (2 * (*v))))
      {
        return;
      }
      else
      {
      }
      *d = 2 * (*d);
      *v = 2 * (*v);
    }
    func_to_recursive_line_47_to_56_0(k, d, x, p, r, b, q, s, v, y, a, c);
  }
  else
  {
  }
}

void func_to_recursive_line_40_to_59_0(int *k, int *b, int *p, int *x, int *r, int *q, int *s, int *y, int *a, int *c)
{
  if (1)
  {
    {
      if (!((*c) >= (*b)))
      {
        return;
      }
      else
      {
      }
      int d;
      int v;
      d = 1;
      v = *b;
      func_to_recursive_line_47_to_56_0(&(*k), &d, &(*x), &(*p), &(*r), &(*b), &(*q), &(*s), &v, &(*y), &(*a), &(*c));
      *c = (*c) - v;
      *k = (*k) + d;
    }
    func_to_recursive_line_40_to_59_0(k, b, p, x, r, q, s, y, a, c);
  }
  else
  {
  }
}

void func_to_recursive_line_33_to_70_0(int *b, int *p, int *r, int *x, int *q, int *s, int *y, int *a)
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
      int c;
      int k;
      c = *a;
      k = 0;
      func_to_recursive_line_40_to_59_0(&k, &(*b), &(*p), &(*x), &(*r), &(*q), &(*s), &(*y), &(*a), &c);
      *a = *b;
      *b = c;
      int temp;
      temp = *p;
      *p = *q;
      *q = temp - ((*q) * k);
      temp = *r;
      *r = *s;
      *s = temp - ((*s) * k);
    }
    func_to_recursive_line_33_to_70_0(b, p, r, x, q, s, y, a);
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
  func_to_recursive_line_33_to_70_0(&b, &p, &r, &x, &q, &s, &y, &a);
  __VERIFIER_assert(((((p * x) - (q * x)) + (r * y)) - (s * y)) == a);
  return 0;
}

