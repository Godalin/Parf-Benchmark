/*
  hardware integer division program, by Manna
  returns q==A//B
  */


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'hard.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]hard.c -o . --pretty_names --trace to_recursive:0 to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "hard.c", 8, "reach_error");
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

void func_to_recursive_line_41_to_51_0(int *q, int *B, int *d, int *A, int *r, int *p)
{
  if (1)
  {
    {
      __VERIFIER_assert((*A) == (((*q) * (*B)) + (*r)));
      __VERIFIER_assert((*d) == ((*B) * (*p)));
      if (!((*p) != 1))
      {
        return;
      }
      else
      {
      }
      *d = (*d) / 2;
      *p = (*p) / 2;
      if ((*r) >= (*d))
      {
        *r = (*r) - (*d);
        *q = (*q) + (*p);
      }
      else
      {
      }
    }
    func_to_recursive_line_41_to_51_0(q, B, d, A, r, p);
  }
  else
  {
  }
}

void func_to_recursive_line_31_to_38_0(int *q, int *B, int *d, int *A, int *r, int *p)
{
  if (1)
  {
    {
      __VERIFIER_assert((*q) == 0);
      __VERIFIER_assert((*r) == (*A));
      __VERIFIER_assert((*d) == ((*B) * (*p)));
      if (!((*r) >= (*d)))
      {
        return;
      }
      else
      {
      }
      *d = 2 * (*d);
      *p = 2 * (*p);
    }
    func_to_recursive_line_31_to_38_0(q, B, d, A, r, p);
  }
  else
  {
  }
}

int main()
{
  int A;
  int B;
  int r;
  int d;
  int p;
  int q;
  A = __VERIFIER_nondet_int();
  B = __VERIFIER_nondet_int();
  assume_abort_if_not(B >= 1);
  r = A;
  d = B;
  p = 1;
  q = 0;
  func_to_recursive_line_31_to_38_0(&q, &B, &d, &A, &r, &p);
  func_to_recursive_line_41_to_51_0(&q, &B, &d, &A, &r, &p);
  __VERIFIER_assert(A == ((d * q) + r));
  __VERIFIER_assert(B == d);
  return 0;
}

