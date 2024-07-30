// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include <pthread.h>
#include "racemacros.h"

int global = 0;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void lock() {
  pthread_mutex_lock(&mutex);
}

void unlock() {
  pthread_mutex_unlock(&mutex);
}

void *t_fun(void *arg) {
  lock();
  access(global);
  unlock();
  return NULL;
}

int main(void) {
  create_threads(t);
  lock();
  assert_racefree(global);
  unlock();
  join_threads(t);
  return 0;
}