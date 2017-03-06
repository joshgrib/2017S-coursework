# References

[//]: # "These code blocks aren't really racket, but that's a close match for the highlighting"

**2 ways to add references**
1. _Implicit_ - Treat every variable as a mutable

```racket
let g = let count = 0
    in proc(d)
        begin set count = -(count ,-1);
            count
        end
<!-- toc orderedList:0 depthFrom:1 depthTo:6 -->
<!-- tocstop -->

in -((g 11), (g 22))
```

2.  _Explicit_ - Add mutable references to the non-mutable ones (explicit references

```racket
let g = let counter = newref (0)
    in proc (d)
        begin
            setref(counter , -( deref(counter) ,-1));
            deref(counter)
        end
in -((g 11) ,(g 22))
```

## Implicit references

### Concrete and abstract syntax

#### Concrete syntax
$<Expression>    :=  set <Identifier> = <Expression>$
$<Expression>    :=  begin <Expression>^{+(;)} end$

The `set` expression is for assignment

A `begin ... end` expression evaluates subexpression in order and returns the value of the last one

### The store
**==The store== is a place to keep values, and be able to reference them.**
>This adds a bunch of cool stuff, like having multiple variables go to one value, or pass arguments by reference.

Variables now have:
1. An address
2. A value

Environments now must be able to take a *variable* and return a *reference* instead of an *expressed value* as before

We have 2 options for the interpreter, based on how we keep track of the store
1. Pass store as an argument
    `value-of::{exp, env, store} -> expval`
2. Hold store in global variable
    `value-of::{exp, env} -> expval`

##### Add a reference
1. Extend the store to hold the new *value*
2. Add the item to the *store*
3. Return the *reference*

##### Get a value
1. Find the *value* in the store that has the given *reference*
2. Return the *value*

##### Set a reference value
1. Find the location of the *reference*
2. Update to store the new *value*

### The interpreter

## Explicit references

### Concrete and abstract syntax
