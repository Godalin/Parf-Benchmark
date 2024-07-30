// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include <pthread.h>
#include <stdio.h>

int myglobal;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;

void munge(pthread_mutex_t *m) {
  pthread_mutex_lock(m);
  myglobal=myglobal+1; // NORACE
  pthread_mutex_unlock(m);
}

void *t_fun(void *arg) {
  munge(&mutex);
  return NULL;
}


int main(void) {
  pthread_t id;
  pthread_create(&id, NULL, t_fun, NULL);
  munge(&mutex);
  pthread_join (id, NULL);
  return 0;
}
