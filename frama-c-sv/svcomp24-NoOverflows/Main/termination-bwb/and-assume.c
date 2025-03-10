// SPDX-FileCopyrightText: 2021 Y. Cyrus Liu <yliu195@stevens.edu>
//
// SPDX-License-Identifier: Apache-2.0

/*
 * Date: 2021-06-21
 * Author: yliu195@stevens.edu
 */
#include <stdlib.h>
extern int __VERIFIER_nondet_int(void);

//void __VERIFIER_assume();

int main (){
  int a, x;
  x = __VERIFIER_nondet_int();
  a = __VERIFIER_nondet_int();
  /* a = 34; */
  if(!(a>0)) abort();
  while (x>0){
    a--;
    x=x&a;
  }
  return 0;
}
