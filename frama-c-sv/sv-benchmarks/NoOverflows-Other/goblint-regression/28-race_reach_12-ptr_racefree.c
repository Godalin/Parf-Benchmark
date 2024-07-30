// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include <pthread.h>
#include "racemacros.h"

int global = 0;
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutex2 = PTHREAD_MUTEX_INITIALIZER;

void *t_fun(void *arg) {
  int *p = &global;
  pthread_mutex_lock(&mutex1);
  access(*p);
  pthread_mutex_unlock(&mutex1);
  return NULL;
}

int main(void) {
  create_threads(t);
  pthread_mutex_lock(&mutex1);
  assert_racefree(global); 
  pthread_mutex_unlock(&mutex1);
  join_threads(t);
  return 0;
}