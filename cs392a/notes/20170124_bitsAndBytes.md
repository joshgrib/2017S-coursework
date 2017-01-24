# Bits and Bytes
A **bit** is a 0 or 1
A **byte** is 8 bits

## Byte encoding
* Binary $00000000_2$ to $11111111_2$
* Decimal $0_{10}$ to $255_{10}$
* Hex 00~16~ to FF~16~
* Octal $0_8$ to to $377_8$

**Units in bytes below**

C Data type|32 bit|64 bit| x86-64
:--|:--|:--|:--
char|1|1|1
short|2|2|2
int|4|4|4
long|4|**8**|**8**
float|4|4|4
double|8|8|8
long double (Intel-specific)|-|-|10/16
pointer|4|**8**|**8**

## Boolean Algebra
Value|Truth conditions|False conditions
--:|:--|:--
AND|`11`|`00`, `01`, `10`
OR|`01`, `10`, `11`|`00`
NOT|`0`|`1`
XOR|`01`, `10`|`00`, `11`

### Operations of bit vectors
```c
  01101001
& 01010101
----------
  01000001

  01101001
| 01010101
----------
  01111101

  01101001
^ 01010101
----------
  00111100

~ 01010101
----------
  10101010
```

>Side note on representing and manipulating sets:
Bits can be used in place of larger data structures to quickly do things
**Example:** To quickly check for matching courses between students a course list could be mapped to 0s and 1s, then a simple AND will show matches.

## Bit-level operations in C
**&, |, ~, ^** can be used on "integral" types (long, int, short, char, unsigned)

## Contrast: Logic Operations in C
**&&, ||, !**
* view 0 as false
* anything else as true
* always return 0 or 1
* Early termination

## Shift Operations
* Left shift `x << y`
    * Shift `x` left by `y` positions, lose bits on left and fill right with
* Right shift `x >> y`
    * Shift `x` right by `y` positions, lose bits on right
    * In **Logical shift**, the left is filled with 0s
    * In **Arithmetic shift**, the space is filled with the most significant bit on the left
* Undefined behavior for shifting $<$ 0 or $\geq$ the word length
