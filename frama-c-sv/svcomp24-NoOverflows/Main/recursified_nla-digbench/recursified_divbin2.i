/*
  A division algorithm, by Kaldewaij
  returns A//B
*/


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'divbin2.i' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]divbin2.i -o . --pretty_names --trace to_recursive:0 to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *__assertion, const char *__file, unsigned int __line, const char *__function) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
extern void __assert_perror_fail(int __errnum, const char *__file, unsigned int __line, const char *__function) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
extern void __assert(const char *__assertion, const char *__file, int __line) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  (void) (sizeof((0) ? (1) : (0))), __extension__(  {
    if (0)
    {
      ;
    }
    else
    {
      __assert_fail("0", "divbin2.c", 10, __extension__ __PRETTY_FUNCTION__);
    }
  }
);
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

void func_to_recursive_line_37_to_44_0(unsigned *A, unsigned *b, unsigned *B, unsigned *r, unsigned *q)
{
  if (1)
  {
    {
      __VERIFIER_assert((*A) == (((*q) * (*b)) + (*r)));
      if (!((*b) != (*B)))
      {
        return;
      }
      else
      {
      }
      *q = 2 * (*q);
      *b = (*b) / 2;
      if ((*r) >= (*b))
      {
        *q = (*q) + 1;
        *r = (*r) - (*b);
      }
      else
      {
      }
    }
    func_to_recursive_line_37_to_44_0(A, b, B, r, q);
  }
  else
  {
  }
}

void func_to_recursive_line_33_to_35_0(unsigned *r, unsigned *b)
{
  if (1)
  {
    {
      if (!((*r) >= (*b)))
      {
        return;
      }
      else
      {
      }
      *b = 2 * (*b);
    }
    func_to_recursive_line_33_to_35_0(r, b);
  }
  else
  {
  }
}

int main()
{
  unsigned A;
  unsigned B;
  unsigned q;
  unsigned r;
  unsigned b;
  A = __VERIFIER_nondet_uint();
  B = 1;
  q = 0;
  r = A;
  b = B;
  func_to_recursive_line_33_to_35_0(&r, &b);
  func_to_recursive_line_37_to_44_0(&A, &b, &B, &r, &q);
  __VERIFIER_assert(A == ((q * b) + r));
  return 0;
}

