/* algorithm searching for a divisor for factorization, by Knuth */


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'knuth.i' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]knuth.i -o . --pretty_names --trace to_recursive:0
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
      __assert_fail("0", "knuth.c", 7, __extension__ __PRETTY_FUNCTION__);
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

extern double sqrt(double);
void func_to_recursive_line_39_to_67_0(unsigned *a, unsigned *q, unsigned *k, unsigned *s, unsigned *r, unsigned *d, unsigned *t, unsigned *n)
{
  if (1)
  {
    {
      __VERIFIER_assert((((((((*d) * (*d)) * (*q)) - ((2 * (*q)) * (*d))) - ((4 * (*r)) * (*d))) + ((4 * (*k)) * (*d))) + (8 * (*r))) == (8 * (*n)));
      __VERIFIER_assert(((*k) * (*t)) == ((*t) * (*t)));
      __VERIFIER_assert(((((((((((*d) * (*d)) * (*q)) - ((2 * (*d)) * (*q))) - ((4 * (*d)) * (*r))) + ((4 * (*d)) * (*t))) + ((4 * (*a)) * (*k))) - ((4 * (*a)) * (*t))) - (8 * (*n))) + (8 * (*r))) == 0);
      __VERIFIER_assert((((((*d) * (*k)) - ((*d) * (*t))) - ((*a) * (*k))) + ((*a) * (*t))) == 0);
      if (!(((*s) >= (*d)) && ((*r) != 0)))
      {
        return;
      }
      else
      {
      }
      if (((2 * (*r)) + (*q)) < (*k))
      {
        *t = *r;
        *r = ((((2 * (*r)) - (*k)) + (*q)) + (*d)) + 2;
        *k = *t;
        *q = (*q) + 4;
        *d = (*d) + 2;
      }
      else
      {
        if ((((2 * (*r)) + (*q)) >= (*k)) && (((2 * (*r)) + (*q)) < (((*d) + (*k)) + 2)))
        {
          *t = *r;
          *r = ((2 * (*r)) - (*k)) + (*q);
          *k = *t;
          *d = (*d) + 2;
        }
        else
        {
          if (((((2 * (*r)) + (*q)) >= (*k)) && (((2 * (*r)) + (*q)) >= (((*d) + (*k)) + 2))) && (((2 * (*r)) + (*q)) < (((2 * (*d)) + (*k)) + 4)))
          {
            *t = *r;
            *r = ((((2 * (*r)) - (*k)) + (*q)) - (*d)) - 2;
            *k = *t;
            *q = (*q) - 4;
            *d = (*d) + 2;
          }
          else
          {
            *t = *r;
            *r = ((((2 * (*r)) - (*k)) + (*q)) - (2 * (*d))) - 4;
            *k = *t;
            *q = (*q) - 8;
            *d = (*d) + 2;
          }
        }
      }
    }
    func_to_recursive_line_39_to_67_0(a, q, k, s, r, d, t, n);
  }
  else
  {
  }
}

int main()
{
  unsigned n;
  unsigned a;
  unsigned r;
  unsigned k;
  unsigned q;
  unsigned d;
  unsigned s;
  unsigned t;
  n = __VERIFIER_nondet_uint();
  a = __VERIFIER_nondet_uint();
  assume_abort_if_not(n < (((0x7fffffff * 2U) + 1U) / 8));
  assume_abort_if_not(a > 2);
  d = a;
  r = n % d;
  t = 0;
  k = n % (d - 2);
  q = 4 * ((n / (d - 2)) - (n / d));
  s = sqrt(n);
  func_to_recursive_line_39_to_67_0(&a, &q, &k, &s, &r, &d, &t, &n);
  return 0;
}

