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

void insert(struct s *p, struct s **list) {
  p->next = *list;
  *list = p;
}

pthread_mutex_t A_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t B_mutex = PTHREAD_MUTEX_INITIALIZER;

void *t_fun(void *arg) {
  struct s *p = malloc(sizeof(struct s));
  init(p,7);

  pthread_mutex_lock(&A_mutex);
  insert(p, &A);
  pthread_mutex_unlock(&A_mutex);

  pthread_mutex_lock(&B_mutex);
  p->datum++; // RACE!
  pthread_mutex_unlock(&B_mutex);
  return NULL;
}

int main () {
  pthread_t t1;
  struct s *p;
  A = malloc(sizeof(struct s));
  init(A,3);

  pthread_create(&t1, NULL, t_fun, NULL);

  p = malloc(sizeof(struct s));
  init(p,9);

  pthread_mutex_lock(&A_mutex);
  insert(p, &A);
  pthread_mutex_unlock(&A_mutex);

  pthread_mutex_lock(&A_mutex);
  p = A;
  while (p->next) {
    printf("%d\n", p->datum); // RACE!
    p = p->next;
  }
  pthread_mutex_unlock(&A_mutex);
  return 0;
}
