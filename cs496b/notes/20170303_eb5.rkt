#lang racket

;; EXERCISE 1
(define x 2)
#|
> (set! x 3)
> x
3
> (set! x 4) x
4
> (begin (set! x 5) x)
5
> (begin (set! x 5) x)
5
> x x
5
5
> (begin x x)
5
|#


;; EXERCISE 2
(define y x)
#|
> (set! x 3) y
2

x is set to be 2, y is set to be x, then x is reassigned and y doesn't change
From this we know y is defined as a copy of the data, not a reference
|#


;; EXERCISE 3
(define u '(1 2))
(define v u)
#|
> (set! u '(3)) v
'(1 2)

Same as above, v is a copy of u, not a reference
|#


;; EXERCISE 4
(define counter
  (let ((local-state 0))
    (lambda ()
      (let ((dummy (set! local-state (+ local-state 1))))
        local-state))))
#|
> (counter)
1
> (counter)
2
> (+ (counter) (counter))
7
> (eq? (counter) (counter))
#f
|#


;; EXERCISE 5
(define stack
  (let ((stk '()))
    (lambda (message)
      (case message
        ((empty?) (lambda () (null? stk)))
        ((push!)  (lambda (x) (set! stk (cons x stk))))
        ((pop!)   (lambda () (set! stk (cdr stk))))
        ((top) (lambda () (car stk)))
        (else (error "stack: Invalid message " message))))))
#|
> ((stack 'push!) 1)
> ((stack 'push!) 2)
> ((stack 'top))
2
> ((stack 'pop!))
> ((stack 'top))
1
|#


;; EXERCISE 6
(define (ex1 v1 v2)
  (let ((f (let ((lst '())) (lambda (x) (begin (set! lst (cons x lst)) lst)))))
    (begin
      (f v1)
      (f v2))))


;; EXERCISE 7
(require compatibility/mlist)
(define c (mcons 1 2))
(define d (mcons 0 c))
(define e (mcons 0 c))
#|
> (set-mcdr! c 5)
> d
(mcons 0 (mcons 1 5))
> e
(mcons 0 (mcons 1 5))
|#


;; EXERCISE 8
( define l ( mcons 'a ( mcons 'b '() ) ) )
( set-mcdr! ( mcdr l ) l )
#|
> (mcar l)
'a
> (mcar (mcdr (mcdr (mcdr l))))
'b

List "l" is the element 'a, followed  by 'b forever
|#


;; EXERCISE 9
(define x2 2)
(define (modify y)
  (set! y 5))
#|
> (modify x2)
> x
2

I expected 5, if it set the value to be 5 instead of 2.
From this it seems like pass by value, not pass by reference
|#


;; EXERCISE 10
(define x3 (mcons 1 2))
(define (modify2 y)
  (set-mcdr! y 5))
#|
> x3
(mcons 1 2)
> (modify2 x3)
> x3
(mcons 1 5)

In mutable pairs, parameters are passed by reference
|#