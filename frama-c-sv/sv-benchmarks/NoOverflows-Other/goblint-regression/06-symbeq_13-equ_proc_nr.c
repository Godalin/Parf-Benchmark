// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

extern int __VERIFIER_nondet_int();

#include<pthread.h>
#include<stdlib.h>

struct s {
  int datum;
  pthread_mutex_t mutex;
} A, B;

void *t_fun(void *arg) {
  pthread_mutex_lock(&A.mutex);
  A.datum = 5; // NORACE
  pthread_mutex_unlock(&A.mutex);
  return NULL;
}

void update(int *p) {
  *p = 8; // NORACE
}

int main () {
  pthread_mutex_init(&A.mutex, NULL);
  pthread_mutex_init(&B.mutex, NULL);

  int x = __VERIFIER_nondet_int();
  pthread_t id;

  struct s *s;
  int *d;

  pthread_mutex_t *m;

  if (x)
    s = &A;
  else
    s = &B;

  m = &s->mutex;
  d = &s->datum;

  pthread_create(&id,NULL,t_fun,NULL);

  pthread_mutex_lock(m);
  update(d);
  pthread_mutex_unlock(m);

  return 0;
}
