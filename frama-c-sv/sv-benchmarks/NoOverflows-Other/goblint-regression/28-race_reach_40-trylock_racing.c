// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include <pthread.h>
#include "racemacros.h"

int global;
pthread_mutexattr_t mutexattr;
pthread_mutex_t mutex;

void *t_fun(void *arg) {
  pthread_mutex_lock(&mutex);
  access(global);
  pthread_mutex_unlock(&mutex);

  return NULL;
}

int main(void) {
  pthread_mutexattr_init(&mutexattr);
  pthread_mutexattr_settype(&mutexattr, PTHREAD_MUTEX_ERRORCHECK);
  pthread_mutex_init(&mutex, &mutexattr);

  create_threads(t);

  pthread_mutex_trylock(&mutex);
  assert_racefree(global); // UNKNOWN
  pthread_mutex_unlock(&mutex); // no UB because ERRORCHECK
  join_threads(t);
  return 0;
}