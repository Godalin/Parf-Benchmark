// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

#include<pthread.h>
#include<stdlib.h>
#include<stdio.h>

struct s {
  int datum;
  struct s *next;
} *A;

void init (struct s *p, int x) {
  p -> datum = x;
  p -> next = NULL;
}

pthread_mutex_t A_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t B_mutex = PTHREAD_MUTEX_INITIALIZER;

void *t_fun(void *arg) {
  struct s *p = malloc(sizeof(struct s));
  struct s *t;
  init(p,7);

  pthread_mutex_lock(&B_mutex);
  t = A->next;
  A->next = p; // RACE!
  p->next = t;
  pthread_mutex_unlock(&B_mutex);
  return NULL;
}

int main () {
  pthread_t t1;
  struct s *p = malloc(sizeof(struct s));
  init(p,9);

  A = malloc(sizeof(struct s));
  init(A,3);
  A->next = p;

  pthread_create(&t1, NULL, t_fun, NULL);

  pthread_mutex_lock(&A_mutex);
  p = A->next; // RACE!
  printf("%d\n", p->datum);
  pthread_mutex_unlock(&A_mutex);
  return 0;
}
