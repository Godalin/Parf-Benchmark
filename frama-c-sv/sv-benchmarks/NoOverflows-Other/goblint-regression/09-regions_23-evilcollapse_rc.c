// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

extern int __VERIFIER_nondet_int();
extern void abort(void);
void assume_abort_if_not(int cond) {
  if(!cond) {abort();}
}

#include<pthread.h>
#include<stdlib.h>

struct list_head {
  struct list_head *next ;
  struct list_head *prev ;
};

struct s {
  int datum ;
  struct list_head list ;
};

struct cache {
  struct list_head slot[10] ;
  pthread_mutex_t slots_mutex[10] ;
};

struct cache c  ;

static inline void INIT_LIST_HEAD(struct list_head *list) {
  list->next = list;
  list->prev = list;
}

struct s *new(int x) {
  struct s *p = malloc(sizeof(struct s));
  p->datum = x;
  INIT_LIST_HEAD(&p->list);
  return p;
}

static inline void list_add(struct list_head *new, struct list_head *head) {
  struct list_head *next = head->next;
  next->prev = new;
  new->next = next;
  new->prev = head;
  head->next = new;
}

inline static struct list_head *lookup (int d) {
  int hvalue = __VERIFIER_nondet_int();
  assume_abort_if_not(0 <= hvalue && hvalue < 10);
  struct list_head *p;
  p = c.slot[hvalue].next;
  return p;
}

void *f(void *arg) {
  struct s *pos ;
  int j = __VERIFIER_nondet_int();
  assume_abort_if_not(0 <= j);
  struct list_head  const  *p ;
  struct list_head  const  *q ;

  while (j < 10) {
    pthread_mutex_lock(&c.slots_mutex[j]);
    p = c.slot[j].next;
    pos = (struct s *)((char *)p - (size_t)(& ((struct s *)0)->list));

    while (& pos->list != & c.slot[j]) {
      pos->datum++; // RACE!
      q = pos->list.next;
      pos = (struct s *)((char *)q - (size_t)(& ((struct s *)0)->list));
    }

    pthread_mutex_unlock(&c.slots_mutex[j]);
    j ++;
  }
  return 0;
}

int main() {
  struct list_head *p1, *p2;
  pthread_t t1, t2;
  for (int i = 0; i < 10; i++) {
    INIT_LIST_HEAD(&c.slot[i]);
    pthread_mutex_init(&c.slots_mutex[i], NULL);
    for (int j = 0; j < 30; j++) list_add(&new(j*i)->list, &c.slot[i]);
  }
  p1 = lookup(1);
  p2 = lookup(2);
  p1->next = p2->next;
  // per-element scheme no longer safe.
  pthread_create(&t1, NULL, f, NULL);
  pthread_create(&t2, NULL, f, NULL);
  return 0;
}
