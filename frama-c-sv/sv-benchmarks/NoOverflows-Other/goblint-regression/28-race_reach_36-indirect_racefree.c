// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include <pthread.h>
#include "racemacros.h"

int g;
int *g1;
int *g2;

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void *t_fun(void *arg) {
  pthread_mutex_lock(&mutex);
  access(*g1);
  pthread_mutex_unlock(&mutex);
  return NULL;
}

int main(void) {
  g1 = g2 = &g;

  create_threads(t);
  pthread_mutex_lock(&mutex);
  assert_racefree(*g2);
  pthread_mutex_unlock(&mutex);
  join_threads(t);
  return 0;
}
