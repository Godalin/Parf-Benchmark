#include <string.h>
#include <stdlib.h>

// Simulates a non-deterministic sorting (or, more precisely, shuffling)
// function, used to detect runtime errors only.
volatile int qsort_nondet;
extern void qsort(void *base, size_t nmemb, size_t size,
                  int (*compar)(const void *, const void *)) {
  char *src = base, *dst = base;
  for (size_t dst_i = 0; dst_i < nmemb; dst_i++) {
    size_t src_i = qsort_nondet % nmemb;
    if (src_i != dst_i)
      memcpy(dst + (dst_i * size), src + (src_i * size), size);
  }
}

// Stub for a main function which reads arguments from the command line, to be
// used by the Eva plug-in.
// This stub emulates non-deterministic input of up to 5 arguments, each up
// to 256 characters long. This is sufficient to ensure arbitrary input in
// virtually every case.
// Do not forget to add option '-main eva_main' in order to use this stub.

#ifdef __FRAMAC__
# include "__fc_builtin.h"
int main(int, char **);
static volatile int nondet;
int eva_main() {
  int argc = Frama_C_interval(0, 5);
  char argv0[256], argv1[256], argv2[256], argv3[256], argv4[256];
  char *argv[6] = {argv0, argv1, argv2, argv3, argv4, 0};
  //@ loop unroll 5;
  for (int i = 0; i < 5; i++) {
    Frama_C_make_unknown(argv[i], 255);
    argv[i][255] = 0;
  }
  return main(argc, argv);
}
#endif // __FRAMAC__
