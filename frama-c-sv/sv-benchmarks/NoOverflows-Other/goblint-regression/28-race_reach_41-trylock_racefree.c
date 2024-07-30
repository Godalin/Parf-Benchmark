// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include <pthread.h>
#include "racemacros.h"

int global;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void *t_fun(void *arg) {
  pthread_mutex_lock(&mutex);
  access(global);
  pthread_mutex_unlock(&mutex);

  return NULL;
}

int main(void) {
  create_threads(t);

  while(pthread_mutex_trylock(&mutex)){
    // wait for it
  }
  assert_racefree(global);
  pthread_mutex_unlock(&mutex);
  join_threads(t);
  return 0;
}