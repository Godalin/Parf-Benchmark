// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include<pthread.h>
#include<stdlib.h>
#include<stdio.h>

#define list_entry(ptr, type, member) \
  ((type *)((char *)(ptr)-(unsigned long)(&((type *)0)->member)))

struct s {
  int datum;
  pthread_mutex_t mutex;
  int list;
} *A;

void init (struct s *p, int x) {
  p->datum = x;
  pthread_mutex_init(&p->mutex, NULL);
}

void update (int *p) {
  struct s *s = list_entry(p, struct s, list);
  pthread_mutex_lock(&s->mutex);
  s->datum++; // NORACE
  pthread_mutex_unlock(&s->mutex);
}

void *t_fun(void *arg) {
  update(&A->list);
  return NULL;
}

int main () {
  pthread_t t1;
  A = malloc(sizeof(struct s));
  init(A,666);

  pthread_create(&t1, NULL, t_fun, NULL);
  update(&A->list);
  return 0;
}

