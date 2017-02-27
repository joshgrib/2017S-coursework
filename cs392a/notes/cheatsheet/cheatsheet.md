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

## 06 - Machine Level Programming: Basics


## 07 - Machine Level Programming: Control


## 08 - Machine Level Programming: Procedures


## 09 - Machine Level Programming: Data
