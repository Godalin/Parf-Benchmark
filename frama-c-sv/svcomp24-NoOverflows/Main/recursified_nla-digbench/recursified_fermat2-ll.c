/* program computing a divisor for factorisation, by Bressoud */


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'fermat2-ll.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]fermat2-ll.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "fermat2-ll.c", 5, "reach_error");
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

void func_to_recursive_line_33_to_42_0(long long *v, long long *r, long long *u, int *A)
{
  if (1)
  {
    {
      __VERIFIER_assert((4 * ((*A) + (*r))) == (((((*u) * (*u)) - ((*v) * (*v))) - (2 * (*u))) + (2 * (*v))));
      if (!((*r) != 0))
      {
        return;
      }
      else
      {
      }
      if ((*r) > 0)
      {
        *r = (*r) - (*v);
        *v = (*v) + 2;
      }
      else
      {
        *r = (*r) + (*u);
        *u = (*u) + 2;
      }
    }
    func_to_recursive_line_33_to_42_0(v, r, u, A);
  }
  else
  {
  }
}

int main()
{
  int A;
  int R;
  long long u;
  long long v;
  long long r;
  A = __VERIFIER_nondet_int();
  R = __VERIFIER_nondet_int();
  assume_abort_if_not(((((long long) R) - 1) * (((long long) R) - 1)) < A);
  assume_abort_if_not((A % 2) == 1);
  u = (((long long) 2) * R) + 1;
  v = 1;
  r = (((long long) R) * R) - A;
  func_to_recursive_line_33_to_42_0(&v, &r, &u, &A);
  __VERIFIER_assert((((long long) 4) * A) == ((((u * u) - (v * v)) - (2 * u)) + (2 * v)));
  return 0;
}

