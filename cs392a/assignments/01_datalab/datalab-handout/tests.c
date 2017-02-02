/* Testing Code */

#include <limits.h>
#include <math.h>

/* Routines used by floation point test code */

/* Convert from bit level representation to floating point number */
float u2f(unsigned u) {
  union {
    unsigned u;
    float f;
  } a;
  a.u = u;
  return a.f;
}

/* Convert from floating point number to bit-level representation */
unsigned f2u(float f) {
  union {
    unsigned u;
    float f;
  } a;
  a.f = f;
  return a.u;
}

/* Copyright (C) 1991-2014 Free Software Foundation, Inc.
   This file is part of the GNU C Library.

   The GNU C Library is free software; you can redistribute it and/or
   modify it under the terms of the GNU Lesser General Public
   License as published by the Free Software Foundation; either
   version 2.1 of the License, or (at your option) any later version.

   The GNU C Library is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
   Lesser General Public License for more details.

   You should have received a copy of the GNU Lesser General Public
   License along with the GNU C Library; if not, see
   <http://www.gnu.org/licenses/>.  */
/* This header is separate from features.h so that the compiler can
   include it implicitly at the start of every compilation.  It must
   not itself include <features.h> or any other header that includes
   <features.h> because the implicit include comes before any feature
   test macros that may be defined in a source file before it first
   explicitly includes a system header.  GCC knows the name of this
   header in order to preinclude it.  */
/* glibc's intent is to support the IEC 559 math functionality, real
   and complex.  If the GCC (4.9 and later) predefined macros
   specifying compiler intent are available, use them to determine
   whether the overall intent is to support these features; otherwise,
   presume an older compiler has intent to support these features and
   define these macros by default.  */
/* wchar_t uses ISO/IEC 10646 (2nd ed., published 2011-03-15) /
   Unicode 6.0.  */
/* We do not support C11 <threads.h>.  */
/* 1 */
int test_bitAnd(int x, int y)
{
  return x&y;
}
/* 2 */
int test_getByte(int x, int n)
{
    unsigned char byte;
    switch(n) {
    case 0:
      byte = x;
      break;
    case 1:
      byte = x >> 8;
      break;
    case 2:
      byte = x >> 16;
      break;
    default:
      byte = x >> 24;
      break;
    }
    return (int) (unsigned) byte;
}
/* 3 */
int test_conditional(int x, int y, int z)
{
  return x?y:z;
}
int test_replaceByte(int x, int n, int c)
{
    switch(n) {
    case 0:
      x = (x & 0xFFFFFF00) | c;
      break;
    case 1:
      x = (x & 0xFFFF00FF) | (c << 8);
      break;
    case 2:
      x = (x & 0xFF00FFFF) | (c << 16);
      break;
    default:
      x = (x & 0x00FFFFFF) | (c << 24);
      break;
    }
    return x;
}
/* 4 */
int test_logicalNeg(int x)
{
  return !x;
}
/* 1 */
int test_tmin(void) {
  return 0x80000000;
}
/* 2 */
int test_fitsBits(int x, int n)
{
  int TMin_n = -(1 << (n-1));
  int TMax_n = (1 << (n-1)) - 1;
  return x >= TMin_n && x <= TMax_n;
}
int test_negate(int x) {
  return -x;
}
/* 3 */
int test_isNonNegative(int x) {
  return x >= 0;
}
int test_isLessOrEqual(int x, int y)
{
  return x <= y;
}
/* 4 */
int test_absVal(int x) {
  return (x < 0) ? -x : x;
}
