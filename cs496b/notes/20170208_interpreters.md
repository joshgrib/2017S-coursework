# Interpreters

## Interpreter VS Compiler
Execution via interpreter:
1. Program tests --[Front End]--> Syntax Tree
2. Syntax Tree --[Interpreter]--> Answer

Compilers:
Can optimize, remove unnecessary code, and return assembly language to run. You need a ton of knowledge to make a compiler, so we're going t make an interpreter instead.
1. Program text --[Front End]--> Syntax Tree
2. Syntax tree --[Compiler]--> Translated code
3. Translated code --[Interpreter]--> Answer

### Front End
Both cases need a "front end", which has two phases
1. Program test(list of characters) --[Scanner]--> List of tokens
2. Tokens --[Parser]--> Syntax Tree

## LET: A simple language
### The Concrete Syntax
```
<Program>    ::= <Expression>
<Expression> ::= <Number>
<Expression> ::= <Identifier>
<Expression> ::= -(<Expression>, <Expression>)
<Expression> ::= zero? (<Expression>)
<Expression> ::= if <Expression>
                 then <Expression> else <Expression>
<Expression> ::= let <Identifier> = <Expression> in <Expression>
```
The concrete syntax is what you're allowed to type in the language
#### Examples:
**Valid**
* `x`
* `-(55, -(x, 11))`
* `zero? -(55, -(x, 11))`
* `let y = 23 if zero? (y) then 4 else 6`

**Not Valid**
* `(zero? -(55, -(x, 11)))`
* `zero 4`
* `+(3, 4)`

### The abstract syntax
The variant record:
```racket
(define-datatype program program?
    (a-program
        (exp expression?)))
(define-datatype expression expression?)
```

```racket
(define-datatype expression expression?
    ...)
;; not finished
```

Example:
`zero? (-(55, -(x, 11)))`
becomes
```racket
(a-program
    (zero?-expression
        (diff-exp
            (const-exp 55)
            (diff-exp
                (var-exp x)
                (const-exp 11)))))
```
