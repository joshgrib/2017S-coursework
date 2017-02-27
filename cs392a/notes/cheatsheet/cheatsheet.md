# Systems Programming

Midterms "test your understanding of the concepts and the mathematical principles".

## 01-overview.pdf
* Everything is bits, computers interpret them as numbers, instructions, characters, addresses, etc based on conventions
* The datatype abstraction IS NOT equal to the mathematical abstraction in all ways

## 02 - Bits and Bytes
**Bit** = 0 or 1
**Byte** = 8 bits
* 00000000~2~ - 11111111~2~
* 0~10~ - 255~10~
* 00~16~ - FF~16~
* 0~8~ - 377~8~

### Boolean algebra
* AND `a&b`
    * Intersection
* OR `a|b`
    * Union
* XOR `a^b`
    * Symmetric difference
* NOT `~a`
    * Complement

> Different from boolean operators &&, ||, !

### Shift operators
* Left shift `<<`
    * Fill zeros on rught
* Right shift `>>`
    * Fill left with zeros for **logical shift**
    * Fill with leftmost bit for **arithmetical shift**. ==Be careful about this with negative numbers filling with 1s==.

## 03 - Linux Basics

## 04 - Integers
**Unsigned**
$B2U(X) = \sum^{w-1}_{i=0}{x_i \times 2^i}$

**Two's Complement**
$B2T(X) = -x_{w-1} \times 2^{w-1} + \sum^{w-2}_{i=0}{x_i \times 2^i}$
{$-x_{w-1}\times 2^{w-1}$} is the sign bit

Style|Value|Equation|Example
:--|:--|:--|:--
Unsigned|Min|0|`00000000`
Unsigned|Max|$2^w-1$|`11111111`
Two's Complement|Min|$-2^{w-1}$|`10000000`
Two's Complement|Max|$2^{w-1}-1$|`01111111`
Two's Complement|-1|-1|`11111111`

U = umsigned
T = two's complement
|T~min~| = T~max~+1
U~max~ = 2*T~max~+1

### Conversion and casting
* Bit pattern is maintained, *but reinterpreted*
* Can have unexpected effects: adding or subtracting $2^w$

**Negation** can be done by complementing and incrementing

### Memory
Conceptually a large array of bytes, each with an index that a pointer can be assigned to.

> Note: system provides private address spaces to each process, so they can't corrupt each other's data.

Computers have a **Word Size** that is the size of integer data and addresses on the machine. 32 bits (4 bytes) used to be common, but that limits addressable memory to 4GB. 64 bit is now increasingly common (up to 18 exabytes of addressable memory).
Machines also support data formats not conforming to the word size by using fractions or multiples of the word size, but there is always an integer amount of bytes.

**Byte Ordering**:
* *Big Endian* - least significant byte has highest address
    *Sun, PPC Man, Internet
* *Little Endian* - least significant byte has lowest address
    * x86, most computers

### C Pointers
A `pointer*` gets assigned to the `&address` of a `variable`
```c
int a = 1234; //assign variable
int *p = &a;  //assign pointer to address
```

The address shows where to start to look, and the type(`int`, `long`, etc) says how far to go and how to interpret what is in that space.

### C Strings
An array of characters, encoded in ASCII standard 7 bit encoding of character set, null-terminated with a final character of 0 (0x30).

## 06 - Machine Level Programming: Basics


## 07 - Machine Level Programming: Control


## 08 - Machine Level Programming: Procedures


## 09 - Machine Level Programming: Data
