# Midterm 1 review

## Section 1

1.  **e**
    -   `a%2` == `(~((~0) << 1)) & a`
2.  **c**
    -   Two's complement of a == `(MAX_INT & a) + (~0)`
3.  **g**
    -   `a^a` == `~((a ^ (~0)) | a)`
4.  **a**
    -   `!a` == `~((a | (~a + 1)) >> W) & 1`
5.  **d**
    -   `(a>0)?1:0` == `~((a >> W) | !a)`

## Section 2

6-bit two's complement representations, fill in the table

| Number    | Decimal | Binary |
| :-------- | :------ | :----- |
| Zero      | 0       | 000000 |
| n/a       | -1      | 111111 |
| n/a       | 5       | 000101 |
| n/a       | -10     | 110110 |
| n/a       | 26      | 011010 |
| n/a       | -26     | 100110 |
| TMax      | 31      | 011111 |
| TMin      | -32     | 100000 |
| TMax+TMax | -2      | 111110 |
| TMin+TMin | 0       | 000000 |
| TMin+1    | -31     | 100001 |
| TMin-1    | -31     | 011111 |
| TMax+1    | -32     | 100000 |
| -TMax     | -31     | 100001 |
| -TMin     | -32     | 100000 |

## Section 3
Which function is equivalent to the assembly code

```assembly
mov %edi, %eax
shl $0x5, %eax
lea (%rax, %rdi, 2), %eax
retq
```

```c
int fun7(int a){
    return a*30;
}
int fun8(int a){
    //THIS ONE
    return a*34;
}
int fun9(int a){
    return a*18;
}
```

## Section 4
```c
0x400446e3 <malloc+7>:  callq   0x400446e8 <malloc+12>
0x400446e8 <malloc+12>: popq    %rax
```
What hex value does `%rax` contain?

**`0x400446e8`**

## Section 5
```c
typedef struct {
    char c;
    double *p;
    int i;
    double d;
    short s;
}
```
**Draw the allocation:**
```
 0   1   2   3   4   5   6   7
+---+---+---+---+---+---+---+---+
| c   X   X   X   X   X   X   X  ...
+---+---+---+---+---+---+---+---+

 8   9   10  11  12  13  14  15
+---+---+---+---+---+---+---+---+
  p   p   p   p   p   p   p   p  ...
+---+---+---+---+---+---+---+---+

 16  17  18  19  20  21  22  23
+---+---+---+---+---+---+---+---+
  i   i   i   i   X   X   X   X  ...
+---+---+---+---+---+---+---+---+

 24  25  26  27  28  29  30  31
+---+---+---+---+---+---+---+---+
  d   d   d   d   d   d   d   d  ...
+---+---+---+---+---+---+---+---+

 31  33  34  35  36  37  38  39
+---+---+---+---+---+---+---+---+
  s   s   X   X   X   X   X   X |
+---+---+---+---+---+---+---+---+
```

**How many bytes are allocated?**
40

**What alignment is required?**
8-byte

**If the variable order can be changed what's the minimum allocated and unused space?**
1
