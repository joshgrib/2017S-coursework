# Programming Languages - midterm overview

## List to know:
* Inductive set derivation
* What is the result of executing a program - 1 or 2 questions
* Stores environments closures
* Extend the language, given the abstract syntax tree, change the interpreter and possible the expressed values
* *Do all exercises in the exercise booklets*


## 01 - Intro
Study fundamental concepts of programming languages by:
1. Defining a language
2. Defining the concepts required to execute a program in that languages
3. Define an interpreter that executes such programs

## 02 - Scheme


## 03 - User Defined Data Types
```racket
(define-datatype primColor primColor?
    (red)
    (yellow)
    (blue))
```
Data types defined like this are **variant records**.

Here `primColor?` is the **predicate** to check if value is a representation of a color. `red`, `yellow`, and `blue` are all **constructors** to build each color.

## 04 - Lambda Calculus and Parsing


## 05 - Induction and Recursion


## 06 - LET Language


## 07 - PROC Language


## 08 - REC Language


## 09 - Imperative programming


## 10 - Implicit and explicit refs


---
## Exercise Book 2
```racket
( define-datatype BTree BTree?
    (leaf-t
        (data number ?))
        (node-t
            (data number ?)
            (left BTree ?)
            (right BTree ?)))
;; An example of a BTree
(define ex
    (node-t 2
        (node-t 12 (leaf-t 7) (leaf-t 11))
        (node-t 4 (leaf-t 1) (leaf-t 9)))
```
