// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include <pthread.h>
#include "racemacros.h"

int data = 0;
int *p = &data, *q;

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void *t_fun(void *arg) {
  pthread_mutex_lock(&mutex);
  access(*p);
  pthread_mutex_unlock(&mutex);
  return NULL;
}

int main() {
  create_threads(t);
  q = p;
  pthread_mutex_lock(&mutex);
  assert_racefree(*q);  // TODO
  pthread_mutex_unlock(&mutex);
  return 0;
}
