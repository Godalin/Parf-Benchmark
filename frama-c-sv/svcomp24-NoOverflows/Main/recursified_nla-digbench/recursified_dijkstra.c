/* Compute the floor of the square root, by Dijkstra */


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'dijkstra.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]dijkstra.c -o . --pretty_names --trace to_recursive:0 to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "dijkstra.c", 5, "reach_error");
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

void func_to_recursive_line_36_to_52_0(int *p, int *n, int *h, int *q, int *r)
{
  if (1)
  {
    {
      __VERIFIER_assert((*r) < ((2 * (*p)) + (*q)));
      __VERIFIER_assert((((*p) * (*p)) + ((*r) * (*q))) == ((*n) * (*q)));
      __VERIFIER_assert((((((((((*h) * (*h)) * (*h)) - (((12 * (*h)) * (*n)) * (*q))) + (((16 * (*n)) * (*p)) * (*q))) - (((*h) * (*q)) * (*q))) - (((4 * (*p)) * (*q)) * (*q))) + (((12 * (*h)) * (*q)) * (*r))) - (((16 * (*p)) * (*q)) * (*r))) == 0);
      __VERIFIER_assert((((((((((((*h) * (*h)) * (*n)) - (((4 * (*h)) * (*n)) * (*p))) + ((4 * ((*n) * (*n))) * (*q))) - (((*n) * (*q)) * (*q))) - (((*h) * (*h)) * (*r))) + (((4 * (*h)) * (*p)) * (*r))) - (((8 * (*n)) * (*q)) * (*r))) + (((*q) * (*q)) * (*r))) + (((4 * (*q)) * (*r)) * (*r))) == 0);
      __VERIFIER_assert(((((((((*h) * (*h)) * (*p)) - (((4 * (*h)) * (*n)) * (*q))) + (((4 * (*n)) * (*p)) * (*q))) - (((*p) * (*q)) * (*q))) + (((4 * (*h)) * (*q)) * (*r))) - (((4 * (*p)) * (*q)) * (*r))) == 0);
      __VERIFIER_assert(((((*p) * (*p)) - ((*n) * (*q))) + ((*q) * (*r))) == 0);
      if (!((*q) != 1))
      {
        return;
      }
      else
      {
      }
      *q = (*q) / 4;
      *h = (*p) + (*q);
      *p = (*p) / 2;
      if ((*r) >= (*h))
      {
        *p = (*p) + (*q);
        *r = (*r) - (*h);
      }
      else
      {
      }
    }
    func_to_recursive_line_36_to_52_0(p, n, h, q, r);
  }
  else
  {
  }
}

void func_to_recursive_line_28_to_32_0(int *q, int *n)
{
  if (1)
  {
    {
      if (!((*q) <= (*n)))
      {
        return;
      }
      else
      {
      }
      *q = 4 * (*q);
    }
    func_to_recursive_line_28_to_32_0(q, n);
  }
  else
  {
  }
}

int main()
{
  int n;
  int p;
  int q;
  int r;
  int h;
  n = __VERIFIER_nondet_int();
  p = 0;
  q = 1;
  r = n;
  h = 0;
  func_to_recursive_line_28_to_32_0(&q, &n);
  func_to_recursive_line_36_to_52_0(&p, &n, &h, &q, &r);
  __VERIFIER_assert(((((((((h * h) * h) - ((12 * h) * n)) + ((16 * n) * p)) + ((12 * h) * r)) - ((16 * p) * r)) - h) - (4 * p)) == 0);
  __VERIFIER_assert((((p * p) - n) + r) == 0);
  __VERIFIER_assert((((((((h * h) * p) - ((4 * h) * n)) + ((4 * n) * p)) + ((4 * h) * r)) - ((4 * p) * r)) - p) == 0);
  return 0;
}

