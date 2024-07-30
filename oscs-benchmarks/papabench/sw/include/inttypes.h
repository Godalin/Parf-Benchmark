#ifndef INTTYPES_H_
#define INTTYPES_H_

#ifdef __FRAMAC__
// These definitions are redundant and incompatible with Frama-C's libc
# include <inttypes.h>
#else

typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef signed short int16_t;
typedef unsigned short uint16_t;
typedef signed long int32_t;
typedef unsigned long uint32_t;

#endif // ifdef __FRAMC__

#endif // INTTYPES_H_
