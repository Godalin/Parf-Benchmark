// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include<pthread.h>
#include<stdio.h>
#include "racemacros.h"

struct s {
  int datum;
  pthread_mutex_t mutex;
} a[10];

void *t_fun(void *arg) {
  int i = __VERIFIER_nondet_int();
  assume_abort_if_not(0 <= i && i < 10);
  struct s *p = &a[i];
  pthread_mutex_lock(&p->mutex);
  i++;
  access_or_assert_racefree(p->datum); // TODO
  pthread_mutex_unlock(&p->mutex);
  return NULL;
}

int main () {
  for (int i = 0; i < 10; i++)
    pthread_mutex_init(&a[i].mutex, NULL);

  int i = __VERIFIER_nondet_int();
  assume_abort_if_not(0 <= i && i < 10);
  create_threads(t);

  pthread_mutex_lock(&a[i].mutex);
  access_or_assert_racefree(a[i].datum); // TODO
  pthread_mutex_unlock(&a[i].mutex);

  join_threads(t);
  return 0;
}
