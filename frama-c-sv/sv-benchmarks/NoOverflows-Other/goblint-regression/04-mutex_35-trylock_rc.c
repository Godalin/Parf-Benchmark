// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2005-2021 University of Tartu & Technische Universität München
//
// SPDX-License-Identifier: MIT

/* Based on trylock.c in Butenof's Programming with Posix C. */
#include <pthread.h>
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#define err_abort(code,text) do { \
    fprintf (stderr, "%s at \"%s\":%d: %s\n", \
        text, __FILE__, __LINE__, strerror (code)); \
    abort (); \
    } while (0)

#define SPIN 10000000

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
long counter;
time_t end_time;

void *counter_thread (void *arg) {
  int status;
  int spin;

  while (time (NULL) < end_time) {
    status = pthread_mutex_lock (&mutex);
    if (status != 0)
      err_abort (status, "Lock mutex");
    for (spin = 0; spin < SPIN; spin++)
      counter++; // RACE!
    status = pthread_mutex_unlock (&mutex);
    if (status != 0)
      err_abort (status, "Unlock mutex");
    sleep (1);
  }
  // printf ("Counter is %#lx\n", counter); <-- interesting test for thread IDs.
  return NULL;
}

void *monitor_thread (void *arg) {
  int status;
  int misses = 0;

  while (time (NULL) < end_time) {
    sleep (3);
    status = pthread_mutex_trylock (&mutex);
    if (status != EBUSY) {
      if (status != 0)
        err_abort (status, "Trylock mutex");
      printf ("Counter is %ld\n", counter/SPIN); // NORACE
      status = pthread_mutex_unlock (&mutex);
      if (status != 0)
        err_abort (status, "Unlock mutex");
    } else
      counter++; // RACE!
  }
  printf ("Monitor thread missed update %d times.\n", misses);
  return NULL;
}

int main (int argc, char *argv[]) {
  int status;
  pthread_t counter_thread_id;
  pthread_t monitor_thread_id;

  end_time = time (NULL) + 60;
  status = pthread_create (&counter_thread_id, NULL, counter_thread, NULL);
  if (status != 0)
    err_abort (status, "Create counter thread");
  status = pthread_create (&monitor_thread_id, NULL, monitor_thread, NULL);
  if (status != 0)
    err_abort (status, "Create monitor thread");
  status = pthread_join (counter_thread_id, NULL);
  if (status != 0)
    err_abort (status, "Join counter thread");
  status = pthread_join (monitor_thread_id, NULL);
  if (status != 0)
    err_abort (status, "Join monitor thread");
  return 0;
}
