Today we're just working on exercise book 4 to practice stuff.

**Always a test question:** Write the extant environment for a program at some point in the execution

## Exercise book 4 - The PROC Language


Here's a way to kinda sneak recursion into a language that doesn't
have it built-in
Only works if language isn't typed
```
let f =
    proc (g)
        proc (x)
            if zero?(x) then 1
            else *(x, ((g g) -(x 1)))
in ((f f) 4)
```


### Exercise 1
Show the following is a program in PROC.

>let f = proc (x) -(x 11) in (f 77)

let f = proc (x) -(x 11) in (<identifier> 77)
let f = proc (x) -(x 11) in (<identifier> <number>)
let f = proc (x) -(x 11) in (<expression> <expression>)
let f = proc (x) -(x 11) in <expression>
let f = proc (x) -(x <number>) in <expression>
let f = proc (x) -(<identifier> <number>) in <expression>
let f = proc (x) -(<expression> <expression>) in <expression>
let f = proc (x) <expression> in <expression>
let f = proc (<identifier>) <expression> in <expression>
let f = <expression> in <expression>
let <identifier> = <expression> in <expression>
<expression>
<program>


### Exercise 2
;; Which program tree is equal to `let pred = proc(x) -(x, 1) in (pred 5)`?

(a-program
    (let-exp 'pred
        (proc-exp 'x (diff-exp (var-exp 'x) (num-val 1)))
        (call-exp (var-exp 'pred  (num-val 5)))))

### Exercise 3
;;What is the new type of result (expressed value) that a program in the PROC-Language can produce as a result of its evaluation?
;;INT, BOOL, and now CLOS

### Exercise 4
;;Write an expression of each of the types below:
;;1. expression
(num-val 2)

;;2. environment?
(extend-env 'x (num-val 2) (empty-env))

;;3. clos?



### Exercise 5


### Exercise 6


### Exercise 7


### Exercise 8


### Exercise 9


### Exercise 10


### Exercise 11
;;Consider the following code in PROC
let x =2
in let y = proc ( d ) x
in let z = proc ( d ) x
in 3
;;Draw the environment used by the interpreter when it is about to evaluate line 4.


### Exercise 12
