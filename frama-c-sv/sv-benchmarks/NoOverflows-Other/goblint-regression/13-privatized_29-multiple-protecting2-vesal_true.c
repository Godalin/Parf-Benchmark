// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include <assert.h>
extern void abort(void);
void reach_error() { assert(0); }
void __VERIFIER_assert(int cond) { if(!(cond)) { ERROR: {reach_error();abort();} } }

// Copied & modified from 13/24.
#include <pthread.h>

int g2;
pthread_mutex_t mutex1 = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t mutex2 = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t __global_lock = PTHREAD_MUTEX_INITIALIZER;

void *t2_fun(void *arg) {
  pthread_mutex_lock(&mutex2);
  pthread_mutex_lock(&__global_lock);
  g2++;
  pthread_mutex_unlock(&__global_lock); // Write Mine influence: [[g2, __global_lock], t2_fun, {mutex2}] -> 1
  pthread_mutex_lock(&__global_lock);
  g2--;
  pthread_mutex_unlock(&__global_lock); // Write Mine influence: [[g2, __global_lock], t2_fun, {mutex2}] -> 0
  pthread_mutex_unlock(&mutex2);
  return NULL;
}

int main(void) {
  pthread_t id2;
  pthread_create(&id2, NULL, t2_fun, NULL);

  pthread_mutex_lock(&mutex1);
  pthread_mutex_lock(&__global_lock); // Read & join to g2 Mine influence: [[g2, __global_lock], t2_fun, {mutex2}] -> (0 join 1 = Unknown)
  __VERIFIER_assert(0 <= g2);
  __VERIFIER_assert(g2 <= 1);
  pthread_mutex_unlock(&__global_lock);

  pthread_mutex_lock(&mutex2);
  pthread_mutex_lock(&__global_lock);
  __VERIFIER_assert(g2 == 0);
  pthread_mutex_unlock(&__global_lock);
  pthread_mutex_unlock(&mutex2);

  pthread_mutex_unlock(&mutex1);

  pthread_join(id2, NULL);
  return 0;
}