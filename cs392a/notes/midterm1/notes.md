# Systems Programming - Bits to Machine Code

Midterm will "test your understanding of the concepts and the mathematical principles".



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

-   `leaq <src> <dest>` - load effective address - `dest` = address of `src`, useful for shift+add operation
    -   `leaq (%rdi, %rdi, 2), %rax` means `%rax` = `%rdi` + `%rdi*2`
    -   `leaq (%rdi, %rdi, 2), %rax` means `%rax` = `%rdi` + `%rdi*2`

| Command              | Meaning                    | Note                            |
| :------------------- | :------------------------- | :------------------------------ |
| `leadq <src> <dst>`  | `dst`=addressOf(`src`)     | Load effective address          |
| `addq <src> <dest>`  | `dest`=`dest`+`src`        | Add                             |
| `subq <src> <dest>`  | `dest`=`dest`-`src`        | Subtract                        |
| `imulq <src> <dest>` | `dest`=`dest`x`src`        | Signed Integer Multiply         |
| `salq <src> <dest>`  | `dest`=`dest`&lt;&lt;`src` | Shift arithmetic left (=`shlq`) |
| `sarq <src> <dest>`  | `dest`=`dest`>>`src`       | Shift arithmetic right          |
| `shrq <src> <dest>`  | `dest`=`dest`>>`src`       | Shift logical right             |
| `xorg <src> <dest>`  | `dest`=`dest` `src`        | Logical exclusive or            |
| `andq <src> <dest>`  | `dest`=`dest` `src`        | Logical and                     |
| `orq <src> <dest>`   | `dest`=`dest` `src`        | Logical or                      |
| `incq <dest>`        | `dest` = `dest`+1          | Increment                       |
| `decq <dest>`        | `dest` = `dest`-1          | Decrement                       |
| `negq <dest>`        | `dest` = -`dest`           | Negate(two-complement)          |
| `notq <dest>`        | `dest` = ~`dest`           | Logical not                     |

## 07 - Machine-Level Programming: Control

**Processor state** and register usage

-   Temporary data = (`%rax`, ...)
-   Location of runtime stack = (`%rsp`)
-   Location of current code control point = (`%rip`, ...)
-   Status of recent tests = (`CF`, `ZF`, `SF`, `OF`)
    ### Conditional codes
-   **`CF`** - carry flag (for unsigned)
-   **`SF`** - sign flag (for signed)
-   **`ZF`** - zero flag
-   **`OF`** - overflow flag (for signed)

**Can by ==set implicitly by using arithmetic operations== (notably not `leaq`)**
Example: `addq <src> <dest> = <res>`

-   CF set for unsigned overflow
-   ZF set if <res> == 0
-   SF set if <res> &lt; 0, marked as signed
-   OF set for signed overflow with two's complement

**Can be ==set explicitly by comparison==**
Example: `cmpq <b> <a>` is like doing `a-b` without setting a destination

-   CF set if carry on most significant bit
-   ZF set if `b`==`a`
-   SF set if (`a`-`b`)&lt;0 as signed
-   OF set for two's complement overflow
      `(a>0 && b<0 && (a-b)<0) || (a<0 && b>0 && (a-b)>0)`

**Can be ==set explicitly by test==**
Example: `testq <b>, <a>` is like doing `a&b` without setting destination, good for using one as a mask and getting flag values

-   ZF set if `a&b==0`
-   SF set if `a&b<0`

#### Reading condition codes

**SetX Commands** set the low-order byte of the destination to be 0 or 1 based on combination of condition codes, does not alter other 7 bytes

| Name           | Condition              | Description               |
| :------------- | :--------------------- | :------------------------ |
| `sete <dest>`  | `ZF`                   | Equal/ zero               |
| `setne <dest>` | ~`ZF`                  | Not equal/ not zero       |
| `sets <dest>`  | `SF`                   | Negative                  |
| `setns <dest>` | ~`SF`                  | Nonnegative               |
| `setg <dest>`  | ~(`SF`^`OF`) AND ~`ZF` | Greater(signed)           |
| `setge <dest>` | ~(`SF`^`OF`)           | Greater or equal (signed) |
| `setl <dest>`  | (`SF`^`OF`)            | Less (signed)             |
| `setle <dest>` | (`SF`^`OF`) OR `ZF`    | Less of equal (signed)    |
| `seta <dest>`  | ~`CF` AND ~`ZF`        | Above (unsigned)          |
| `setb <dest>`  | `CF`                   | Below (unsigned)          |

Usually `movzbl` is often then used to fill the rest of the number

```c
cmpq    %rsi,   %rdi    // Compare x to y
setg    %rax            // Set when >
movzbl  %rax,    %eax   // Zero rest of %rax
```

### Conditional branches

**Jumping** can be done through ==jX instructions==, which jump depending on codition codes

| Name        | Condition              | Description               |
| :---------- | :--------------------- | :------------------------ |
| `jpm <loc>` | 1                      | Unconditional             |
| `je <loc>`  | `ZF`                   | Equal/ zero               |
| `jne <loc>` | ~`ZF`                  | Not equal/ not zero       |
| `js <loc>`  | `SF`                   | Negative                  |
| `jns <loc>` | ~`SF`                  | Nonnegative               |
| `jg <loc>`  | ~(`SF`^`OF`) AND ~`ZF` | Greater(signed)           |
| `jge <loc>` | ~(`SF`^`OF`)           | Greater or equal (signed) |
| `jl <loc>`  | (`SF`^`OF`)            | Less (signed)             |
| `jle <loc>` | (`SF`^`OF`) OR `ZF`    | Less of equal (signed)    |
| `ja <loc>`  | ~`CF` AND ~`ZF`        | Above (unsigned)          |
| `jb <loc>`  | `CF`                   | Below (unsigned)          |

#### Goto Statements

Available in C to jump to location by label

#### Conditional Move

Changing control flow can be expensive so sometimes it's better to compute both options for branch and then test and condition and return the appropriate value. This works well for simple stuff but can get weird for complex stuff because both sides might get run.

### Loops

**Do-while**
Set loop tag at beginning, then decide if you should jump back to the beginning when you get to the bottom. At the end of each loop it will repeat as long as the condition is true.

```c
loop:
    ...
if(test):
    goto loop
```

**While**
To test before running, start with an instruction to jump to the test at the bottom of the loop, if it's true you enter the loop if not you carry on from there. Alternatively just check for test falsehood right before the loop and jump over it if it's not needed.

```c
goto test           |if(!test):
loop:               |    goto done
    {...}           |loop:
test:               |    {...}
    if(test):       |if(test)
        goto loop   |    goto loop   
                    |done:
```

**For**
Just a `while` where you reassign values used for the test

### Switch Statements

Large switch statements use jump tables
Small switch statements may use decision trees
Switch statements seem pretty complicated in assembly.

## 08 - Machine-Level Programming: Procedures

**Mechanisms of procedures**

-   Pass control
-   Pass data
-   Memory management

### Stack Structure

Stack bottom is at higher addresses, growing toward lower addresses. `%rsp` has the stack top address.

**Operations**

-   `pushq <src>` takes `src`, decrements `%rsp` by 8, then writes `src` into the new location of `%rsp`
-   `popq <dest>` takes the value currently at `%rsp`, increments `%rsp` by 8, then stores the value in `dest`

### Calling conventions

#### Passing control

`callq <label>` = Call procedure: push the return address on to the stack, jump to `label`
The ==return address is the address of the next instruction after the call==.

`ret` = return from procedureL pop address from stack and go to it

#### Passing data

-   Registers hold first 6 arguments
-   Stack
-   Return value

Different conventions pass in data on different registers.
We used the `System V AMD64 ABI` convention, which is used on most unix systems. ==In this convention arguments are passed in on `RDI`, `RSI`, `RDX`, `RCX`, `R8`, `R9`, and then the stack.==

#### Managing local data

For recursion and in general it's useful to split the stack into regions. ==A stack frame is a section of the stack holding state for a given procedure instantiation.==

**Stack Frames**

-   Return information
-   Local storage if needed
-   Temporary space if needed

### Misc

-   Stack frames give each function call private storage
    -   Save registers, local variables, return pointer
-   Register saving conventions prevent functions corrupting each other's data
-   Stack management pattern matches call/return pattern
    -   P calls Q, Q returns before P, last-in first-out

## 09 - Machine-Level Programming: Data

### Arrays

Generally just a section of memory with enough room to fit the data for each element in the array.
2D arrays are arrays of arrays, just a longer block on memory.

Use index arithmetic to access elements,

### Structures

==A structure is a block of memory big enough to hold all the fields.== Fields are ordered according to declaration, compiler determines overall size and position of fields.

**Linked list** is a list of structures where each has a data value and a pointer to the next one
`struct rec {int a[4]; size_t i; struct rec *next}`

#### Data alignment

In **unaligned data** all data members are directly next to each other in memory with no extra space.

In **aligned data** we fit data to be a multiple of a primitive data type size. This is required on some machines and advised on others.
Aligned data can be easier to reference by knowing data will start at common places. The compiler adds gaps in the structure to align the fields.
