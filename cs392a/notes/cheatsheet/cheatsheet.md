# Systems Programming

Midterms "test your understanding of the concepts and the mathematical principles".

## 01-overview.pdf

-   Everything is bits, computers interpret them as numbers, instructions, characters, addresses, etc based on conventions
-   The datatype abstraction IS NOT equal to the mathematical abstraction in all ways

## 02 - Bits and Bytes

**Bit** = 0 or 1
**Byte** = 8 bits

-   00000000~2~ - 11111111~2~
-   0~10~ - 255~10~
-   00~16~ - FF~16~
-   0~8~ - 377~8~

### Boolean algebra

-   AND `a&b`
    -   Intersection
-   OR `a|b`
    -   Union
-   XOR `a^b`
    -   Symmetric difference
-   NOT `~a`
    -   Complement

> Different from boolean operators &&, ||, !

### Shift operators

-   Left shift `<<`
    -   Fill zeros on rught
-   Right shift `>>`
    -   Fill left with zeros for **logical shift**
    -   Fill with leftmost bit for **arithmetical shift**. ==Be careful about this with negative numbers filling with 1s==.

## 03 - Linux Basics

## 04 - Integers

**Unsigned**
$B2U(X) = \sum^{w-1}\_{i=0}{x_i \times 2^i}$

**Two's Complement**
$B2T(X) = -x_{w-1} \times 2^{w-1} + \sum^{w-2}_{i=0}{x_i \times 2^i}$
{$-x_{w-1} \times 2^{w-1}$} is the sign bit

| Style            | Value | Equation    | Example    |
| :--------------- | :---- | :---------- | :--------- |
| Unsigned         | Min   | 0           | `00000000` |
| Unsigned         | Max   | $2^w-1$     | `11111111` |
| Two's Complement | Min   | $-2^{w-1}$  | `10000000` |
| Two's Complement | Max   | $2^{w-1}-1$ | `01111111` |
| Two's Complement | -1    | -1          | `11111111` |

U = umsigned
T = two's complement
|T~min~| = T~max~+1
U~max~ = 2\*T~max~+1

### Conversion and casting

-   Bit pattern is maintained, _but reinterpreted_
-   Can have unexpected effects: adding or subtracting $2^w$

**Negation** can be done by complementing and incrementing

### Memory

Conceptually a large array of bytes, each with an index that a pointer can be assigned to.

> Note: system provides private address spaces to each process, so they can't corrupt each other's data.

Computers have a **Word Size** that is the size of integer data and addresses on the machine. 32 bits (4 bytes) used to be common, but that limits addressable memory to 4GB. 64 bit is now increasingly common (up to 18 exabytes of addressable memory).
Machines also support data formats not conforming to the word size by using fractions or multiples of the word size, but there is always an integer amount of bytes.

**Byte Ordering**:

-   _Big Endian_ - least significant byte has highest address
      \*Sun, PPC Man, Internet
-   _Little Endian_ - least significant byte has lowest address
    -   x86, most computers

### C Pointers

A `pointer*` gets assigned to the `&address` of a `variable`

```c
int a = 1234; //assign variable
int *p = &a;  //assign pointer to address
```

The address shows where to start to look, and the type(`int`, `long`, etc) says how far to go and how to interpret what is in that space.

### C Strings

An array of characters, encoded in ASCII standard 7 bit encoding of character set, null-terminated with a final character of 0 (0x30).

## 06 - Machine-Level Programming: Basics

-   **Architecture** is the part of the processor design that needs to be understood to write assembly/machine code.
-   **Microarchitecture** is an implementation of an architecture.
-   **Machine Code** is the byte-level programs the processor executes.
-   **Assembly Code** is a text representation of machine code.

### CPU and Memory

**CPU**

-   PC - Program counter, address of next instruction, called "RIP" in x86-64
-   Register file - heavily used program data
-   Condition codes - store status info for most recent arithmetic or logical operation, used for conditional branching

**Memory**

-   Byte addressable array, holds code and user data, has a stack to support procedures

**Communication**

-   CPU sends ==addresses== to Memory
-   Memory sends ==data== and ==instructions== to CPU

### C Assembly

#### Data types

-   "Integer" - 1, 2, 4, or 8 bytes for data values and addresses
-   Floating point - 4, 8, or 10 bytes
-   Code -byte sequences encoding instructions
-   "Non aggregate" types such as arrays or structures, which are just contiguous bytes in memory

#### Operators

-   Perform arithmetic function on register or memory data
-   Transfer data between memory and register
-   Transfer control through unconditional jumps to/from procedures and conditional branches

#### Generating code

**Assembler** creates binary encoding for instructions
**Linker** resolves file references and adds libraries, completing the executable

### Assembly basics

**Registers** are places to store data

| Name                       | 64 bit | 32 bit  | Description                            |
| :------------------------- | :----- | :------ | :------------------------------------- |
| Register a extended        | `%rax` | `%eax`  | register a extended for 64 bits        |
| Register b extended        | `%rbx` | `%ebx`  | register b extended for 64 bits        |
| Register c extended        | `%rcx` | `%ecx`  | register c extended for 64 bits        |
| Register d extended        | `%rdx` | `%edx`  | register d extended for 64 bits        |
| Register base pointer      | `%rbp` | `%ebp`  | start of stack                         |
| Register stack pointer     | `%rsp` | `%esp`  | curr stack location, growing downwards |
| Register source index      | `%rsi` | `%esi`  | source for data copies                 |
| Register destination index | `%rdi` | `%edi`  | destination for data copies            |
| Register 8                 | `%r8`  | `%r8d`  | extra register for 64 bit              |
| Register 9                 | `%r9`  | `%r9d`  | extra register for 64 bit              |
| Register 10                | `%r10` | `%r10d` | extra register for 64 bit              |
| Register 11                | `%r11` | `%r11d` | extra register for 64 bit              |
| Register 12                | `%r12` | `%r12d` | extra register for 64 bit              |
| Register 13                | `%r13` | `%r13d` | extra register for 64 bit              |
| Register 14                | `%r14` | `%r14d` | extra register for 64 bit              |
| Register 15                | `%r15` | `%r15d` | extra register for 64 bit              |

**Assembly Codes** say what to do

-   `movq <src> <dest>` - take src and move it to dest
    -   Immediate ->{reg, mem}, reg->{reg, mem}, mem->reg
    -   You cannot move memory to memory in one instruction
    -   Here `mov` is the instruction and the `q` at the end specifies 64 bit data (quad), `l` is used for 32 bit data

Assembly code **operands** are the inputs that tell that code what data to use for their operation.

-   ==Immediate operands== are constant integer data prefixed with `$`, encoded in 1, 2, or 4 bytes
    -   Ex: `$0x400`, `$-533`
-   ==Register operands== are one of the 16 integer registers not reserved for special use
    -   Ex: `%rax`, `%r13`
-   ==Memory operands== are 8 consecutive bytes of memory (64 bits) at the address given by a register
    -   Ex: `(%rax)`

**Memory addressing**

-   ==Normal==, (R), Mem\[Reg[R]]
    -   Get address for register R
    -   `movq (%rcx), %rax`
-   ==Displacement==, D(R), Mem\[Reg[R]+D]
    -   Start at register R and offset by D
    -   `movq 8(%rbp), %rdx`
-   ==General Form==, D(Rb,Ri,S), Mem\[Reg[Rb]+(S\*Reg[Ri])+D]
    -   _D_ = displacement of 1, 2, or 4 bytes
    -   _Rb_ = Base register, any of 16 int registers
    -   _Ri_ = Index Register, any except `%rsp`
    -   _S_ = Scale of 1, 2, 4, 8
    -   Ex: `%rdx=0xf000`, `0x80(,%rdx,2)` = `2*0xf000+0x80` = `0x1e080`
        > `Mem[Reg[Rb]+s*Reg[Ri]+D]`
        > `Mem[null+2*%rdx+0x80]`
        > `Mem[2*(0xf000)+0x80]`
        > `Mem[0x1e000+0x80]`
        > `Mem[0x1e080]`

### Arithmetic and Logical Operations
* `leaq <src> <dest>` - load effective address - `dest` = address of `src`, useful for shift+add operation
    * `leaq (%rdi, %rdi, 2), %rax` means `%rax` = `%rdi` + `%rdi*2`
    * `leaq (%rdi, %rdi, 2), %rax` means `%rax` = `%rdi` + `%rdi*2`

Command|Meaning|Note
:--|:--|:--
`leadq <src> <dst>`| `dst`=addressOf(`src`)
`addq <src> <dest>`| `dest`=`dest`+`src`|Add
`subq <src> <dest>`| `dest`=`dest`-`src`|Subtract
`imulq <src> <dest>`| `dest`=`dest`x`src`|Signed Integer Multiply
`salq <src> <dest>`| `dest`=`dest`<<`src`|Shift arithmetic left (=`shlq`)
`sarq <src> <dest>`| `dest`=`dest`>>`src`|Shift arithmetic right
`shrq <src> <dest>`| `dest`=`dest`>>`src`|Shift logical right
`xorg <src> <dest>`| `dest`=`dest` `src`|Logical exclusive or
`andq <src> <dest>`| `dest`=`dest` `src`|Logical and
`orq <src> <dest>`| `dest`=`dest` `src`|Logical or
`incq <dest>`| `dest` = `dest`+1|Increment
`decq <dest>`| `dest` = `dest`-1|Decrement
`negq <dest>`| `dest` = -`dest`|Negate(two-complement)
`notq <dest>`| `dest` = ~`dest`|Logical not

## 07 - Machine-Level Programming: Control


## 08 - Machine-Level Programming: Procedures

## 09 - Machine-Level Programming: Data
