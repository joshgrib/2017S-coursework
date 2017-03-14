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
**Overall, this just adds `ref-val` to the expressed values**.

Now we can basically use pointers. We make a new type `ref-val` that returns a reference for the address in the store.

Additionally, we can change the environment back to the old way. Instead of everything being a reference to the store we can make them all expressed values, with some being references and some not.

With implicit refs, *every variable is mutable*. Allocation, dereferencing, and mutation are built in.
* With the explicit design, we give a clear account of these features.

>**Expressed and denoted values**
>
>Implicit refs
>* `ExpVal` = `Int` + `Bool` + `Proc`
>* `DenVal` = `Ref(ExpVal)`
>
>Explicit refs
>* `ExpVal` = `Int` + `Bool` + `Proc` + `Ref(ExpVal)`
>* `DenVal` = `ExpVal`
>
>*Before we could use references, but now we have access to them*.

We can now also have memory leaks, because we can create values and references in the store without having them assigned to a variable in the environment, so they're in the store but not accessible in any way.
>"It's like candy is the data, and the store in a candy jar. The issue is if you don't have it in the environment it's like you have no hands. You have no way of getting to it."

>BLASPHEMY!
> `deref(ref-val 0)` would be a naive way to try to get the value for garbage in the store. The issue with this is *it's mixing the language with the implementation.* Those parts aren't meant to communicate with each other. (This would be a parser error anyway  because `ref-val` isn't part of the syntax).

### Concrete and abstract syntax

### Specification
* `deref` will return the value for the given reference
* `setref` will take in a value, add it to the store, and return the `ref-val`.

### Implementation


### Example - swap
```racket
let swap = proc(x) proc(y)
    begin
        let t = deref(x)
        in
        begin
            setref(x, deref(y));
            setref(y, t)
        end
    end
in
let x - newref(1)
in
let y - newref(2)
in
    begin
        ((swap x) y);
        deref(x)
    end
```
