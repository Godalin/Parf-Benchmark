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
} *A, *B;

void init (struct s *p, int x) {
  p -> datum = x;
  p -> next = NULL;
}

pthread_mutex_t A_mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_mutex_t B_mutex = PTHREAD_MUTEX_INITIALIZER;

void *t_fun(void *arg) {
  pthread_mutex_lock(&A_mutex);
  A->next->datum++; // RACE!
  pthread_mutex_unlock(&A_mutex);

  pthread_mutex_lock(&B_mutex);
  B->next->datum++; // RACE!
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
  B = malloc(sizeof(struct s));
  init(B,5);

  B->next = p;

  pthread_create(&t1, NULL, t_fun, NULL);

  pthread_mutex_lock(&A_mutex);
  p = A->next;
  printf("%d\n", p->datum); // RACE!
  pthread_mutex_unlock(&A_mutex);

  pthread_mutex_lock(&B_mutex);
  p = B->next;
  printf("%d\n", p->datum); // RACE!
  pthread_mutex_unlock(&B_mutex);
  return 0;
}
