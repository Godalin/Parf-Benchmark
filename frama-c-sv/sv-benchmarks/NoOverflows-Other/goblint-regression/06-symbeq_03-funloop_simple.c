// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include<pthread.h>
#include<stdio.h>

struct cache_entry {
  int refs;
  pthread_mutex_t refs_mutex;
} cache[10];

void cache_entry_addref(struct cache_entry *entry) {
  pthread_mutex_lock(&entry->refs_mutex);
  entry->refs++; // RACE!
  pthread_mutex_unlock(&entry->refs_mutex);
}

void *t_fun(void *arg) {
  int i;
  for(i=0; i<10; i++)
    cache_entry_addref(&cache[i]); // NOWARN
  return NULL;
}

int main () {
  for (int i = 0; i < 10; i++)
    pthread_mutex_init(&cache[i].refs_mutex, NULL);

  int i;
  pthread_t t1;
  pthread_create(&t1, NULL, t_fun, NULL);
  for(i=0; i<10; i++)
    cache_entry_addref(&cache[i]); // NOWARN
  cache[5].refs++; // RACE!
  return 0;
}
