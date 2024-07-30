// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include <pthread.h>
#include <stdio.h>
#include "racemacros.h"

int global = 0;
pthread_mutex_t gm = PTHREAD_MUTEX_INITIALIZER;

void bad() { 
  access(global);
} 
void good() { 
  pthread_mutex_lock(&gm);
  access(global);
  pthread_mutex_unlock(&gm);
}

void (*f)() = good;
pthread_mutex_t fm = PTHREAD_MUTEX_INITIALIZER;

void *t_fun(void *arg) {
  void (*g)();

  pthread_mutex_lock(&fm);
  g = f;
  pthread_mutex_unlock(&fm);

  g();
  return NULL;
}

int main() {
  create_threads(t);

  pthread_mutex_lock(&fm);
  f = good;
  pthread_mutex_unlock(&fm);

  pthread_mutex_lock(&gm);
  assert_racefree(global);
  pthread_mutex_unlock(&gm);

  join_threads(t);
  return 0;
}