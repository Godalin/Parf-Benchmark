/*
 * algorithm for computing simultaneously the GCD and the LCM,
 * by Sankaranarayanan
 */


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'lcm1.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]lcm1.c -o . --pretty_names --trace to_recursive:0 to_recursive:0 to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "lcm1.c", 8, "reach_error");
}

extern unsigned __VERIFIER_nondet_uint(void);
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

void func_to_recursive_line_48_to_53_0(unsigned *u, unsigned *a, unsigned *b, unsigned *x, unsigned *y, unsigned *v)
{
  if (1)
  {
    {
      __VERIFIER_assert((((*x) * (*u)) + ((*y) * (*v))) == ((*a) * (*b)));
      if (!((*x) < (*y)))
      {
        return;
      }
      else
      {
      }
      *y = (*y) - (*x);
      *u = (*u) + (*v);
    }
    func_to_recursive_line_48_to_53_0(u, a, b, x, y, v);
  }
  else
  {
  }
}

void func_to_recursive_line_40_to_45_0(unsigned *u, unsigned *a, unsigned *b, unsigned *x, unsigned *y, unsigned *v)
{
  if (1)
  {
    {
      __VERIFIER_assert((((*x) * (*u)) + ((*y) * (*v))) == ((*a) * (*b)));
      if (!((*x) > (*y)))
      {
        return;
      }
      else
      {
      }
      *x = (*x) - (*y);
      *v = (*v) + (*u);
    }
    func_to_recursive_line_40_to_45_0(u, a, b, x, y, v);
  }
  else
  {
  }
}

void func_to_recursive_line_35_to_38_0(unsigned *u, unsigned *a, unsigned *b, unsigned *x, unsigned *y, unsigned *v)
{
  if (1)
  {
    {
      __VERIFIER_assert((((*x) * (*u)) + ((*y) * (*v))) == ((*a) * (*b)));
      if (!((*x) != (*y)))
      {
        return;
      }
      else
      {
      }
      func_to_recursive_line_40_to_45_0(&(*u), &(*a), &(*b), &(*x), &(*y), &(*v));
      func_to_recursive_line_48_to_53_0(&(*u), &(*a), &(*b), &(*x), &(*y), &(*v));
    }
    func_to_recursive_line_35_to_38_0(u, a, b, x, y, v);
  }
  else
  {
  }
}

int main()
{
  unsigned a;
  unsigned b;
  unsigned x;
  unsigned y;
  unsigned u;
  unsigned v;
  a = __VERIFIER_nondet_uint();
  b = __VERIFIER_nondet_uint();
  assume_abort_if_not(a >= 1);
  assume_abort_if_not(b >= 1);
  assume_abort_if_not(a <= 65535);
  assume_abort_if_not(b <= 65535);
  x = a;
  y = b;
  u = b;
  v = 0;
  func_to_recursive_line_35_to_38_0(&u, &a, &b, &x, &y, &v);
  __VERIFIER_assert(((u * y) + (v * y)) == (a * b));
  __VERIFIER_assert(x == y);
  return 0;
}

