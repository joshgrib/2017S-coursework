;; QUESTIONS
;; Type notation on 1:4 - bit?
;; Type notation on 1:(8, 9, 10)

#lang racket
;;  Josh Gribbon
;;  CS496A - Programming Languages
;;  Homework 1
;; I pledge my honor I have abided by the Stevens Honor System. ~Josh Gribbon

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Exercise 1
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Problem 1
;; a -> num
(define (seven x)
    7
)


;; Problem 2
;; num -> num
(define (sign x)
    (cond
        [(+ x) 1]
        [(- x) -1]
        [else 0]
    )
)


;; Problem 3
;; num -> num
(define (absolute x)
    (abs x)
)


;; Problem 4
;; I figured instead of doing if's for each I'd make a NAND and build from that
;; bit, bit -> bit
(define (nand x y)
    (if (equal? x 1)
        (if (equal? y 1)
            0
            1
        )
        1
    )
)
;; bit -> bit
(define (notp x)
    (nand x x)
)
;; bit, bit -> bit
(define (andp x y)
    (nand
        (nand x y)
        (nand x y)
    )
)
;; bit, bit -> bit
(define (orp x y)
    (nand
        (nand x x)
        (nand y y)
    )
)
;; bit, bit -> bit
(define (xorp x y)
    (nand
        (nand x (nand x y))
        (nand y (nand x y))
    )
)


;; Problem 5
;; num, num -> bool
(define (divideBy x y)
    (zero? (remainder x y))
)


;; Problem 6
;; [a] -> bool
(define (singleton? lst)
    (equal? (length lst) 1)
)


;; Problem 7
;; (a, b) -> (b, a)
(define (swap pr)
    (cons (cadr pr) (car pr))
)


;; Problem 8
;; fn, a -> b
(define (app func param)
    (func param)
)


;; Problem 9
;; fn, a -> b
(define (twice func param)
    (func (func param))
)


;; Problem 10
;; Named like this because compose is an actual function already
;; fn1, fn2, a -> b
(define (compose_ func1 func2 param)
    (func1 (func2 param))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Exercise 2
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Problem 1
(define (belongsTo set x)
    (if (equal? (length set) 0)
        #f
        (or
            (equal? (car set) x)
            (belongsTo (cdr set) x)
        )
    )
)
(define (union set1 set2)
    set1
)
(define (intersection set1 set2)
    set1
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Test cases
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (equal? () )
;;;;;;;;;;;;;;;;;;; Exercse 1 test cases
(define test_ex1p1
    (and
        (equal? (seven 80) 7)
        (equal? (seven 0) 7)
        (equal? (seven 2) 7)
        (equal? (seven 2000) 7)
    )
)
(define test_ex1p2
    (and
        (equal? (sign 100) 1)
        (equal? (sign 3) 1)
        (equal? (sign 1) 1)
        (equal? (sign 0) 0)
        (equal? (sign -1) -1)
        (equal? (sign -40) -1)
    )
)
(define test_ex1p3
    (and
        (equal? (absolute 100) 100)
        (equal? (absolute 1) 1)
        (equal? (absolute 0) 0)
        (equal? (absolute -1) 1)
        (equal? (absolute -100) 100)
    )
)
(define test_ex1p4
    (and
        (equal? (andp 0 0) 0)
        (equal? (andp 0 1) 0)
        (equal? (andp 1 0) 0)
        (equal? (andp 1 1) 1)
        (equal? (orp 0 0) 0)
        (equal? (orp 0 1) 1)
        (equal? (orp 1 0) 1)
        (equal? (orp 1 1) 1)
        (equal? (notp 1) 0)
        (equal? (notp 0) 1)
        (equal? (xorp 0 0) 0)
        (equal? (xorp 0 1) 1)
        (equal? (xorp 1 0) 1)
        (equal? (xorp 1 1) 0)
    )
)
(define test_ex1p5
    (and
        ;;(equal? (divideBy 1 0) (error "Cannot divide by 0"))
        (equal? (divideBy 12 8) #f)
        (equal? (divideBy 12 3) #t)
        (equal? (divideBy 12 2) #t)
        (equal? (divideBy 12 -3) #t)
        (equal? (divideBy -12 2) #t)
        (equal? (divideBy 120 82) #f)
    )
)
(define test_ex1p6
    (and
        (equal? (singleton? '(1 2 3)) #f)
        (equal? (singleton? '(1 2)) #f)
        (equal? (singleton? '(1)) #t)
        (equal? (singleton? '("One")) #t)
        (equal? (singleton? '('(1 2 3))) #t)
        (equal? (singleton? '()) #f)
        (equal? (singleton? '(121 "Hello")) #f)
        (equal? (singleton? '(#f)) #t)
    )
)
(define test_ex1p7
    (and
        (equal? (swap '(0 0)) '(0 . 0))
        (equal? (swap '(1 0)) '(0 . 1))
        (equal? (swap '(12 42)) '(42 . 12))
        (equal? (swap '(-420 69)) '(69 . -420))
        (equal? (swap '(-12 -42)) '(-42 . -12))
    )
)
(define test_ex1p8
    (and
        (equal? (app car '(1 2 3)) 1)
        (equal? (app cdr '(1 2 3)) '(2 3))
        (equal? (app list? '(1 2 3)) #t)
        (equal? (app list? "Hello") #f)
    )
)
(define test_ex1p9
    (and
        (equal? (twice cdr '(1 2 3)) '(3))
        (equal? (twice list? '(1 2 3)) #f)
        (equal? (twice list? "Hello") #f)
    )
)
(define test_ex1p10
    (and
        (equal? (compose_ car cdr '(1 2 3)) 2)
        (equal? (compose_ add1 add1 2) 4)
        (equal? (compose_ add1 sub1 2) 2)
        (equal? (compose_ add1 abs -2) 3)
        (equal? (compose_ abs add1 -2) 1)
    )
)
;;;;;;;;;;;;;;;;;;; Exercse 2 test cases
(define test_ex2p1
    (and
        (equal? (belongsTo '(1 2 3) 1) #t)
        (equal? (belongsTo '(1 2 3) 3) #t)
        (equal? (belongsTo '(1 2 3) 0) #f)
        (equal? (belongsTo '(1 2 3) 4) #f)
        (equal? (union '(1 2 3) '(1 2 3)) '(1 2 3))
        (equal? (union '(1 2 3) '(1 4 5)) '(1 2 3 4 5))
        (equal? (union '(1 2 3) '(8)) '(1 2 3 8))
        (equal? (union '(1) '(8)) '(1 8))
        (equal? (union '() '()) '())
        (equal? (intersection '(1 2 3) '(1 -2 3)) '(1 3))
        (equal? (intersection '(1 2 3) '(1 4 5)) '(1))
        (equal? (intersection '(1 2 3) '(8)) '())
        (equal? (intersection '(1 3 5) '(3 5 9)) '(3 5))
        (equal? (intersection '(1) '()) '())
    )
)
(define test_ex2p2
    (and
        (equal? #t #t)
    )
)
(define test_ex2p3
    (and
        (equal? #t #t)
    )
)
;;;;;;;;;;;;;;;;;;; Exercse 3 test cases
(define test_ex3p1
    (and
        (equal? #t #t)
    )
)
(define test_ex3p2
    (and
        (equal? #t #t)
    )
)
(define test_ex3p3
    (and
        (equal? #t #t)
    )
)
(define test_ex3p4
    (and
        (equal? #t #t)
    )
)
(define test_ex3p5
    (and
        (equal? #t #t)
    )
)
(define test_ex3p6
    (and
        (equal? #t #t)
    )
)
;;;;;;;;;;;;;;;;;;; Exercse 4 test cases
(define test_ex4p1
    (and
        (equal? #t #t)
    )
)
(define test_ex4p2
    (and
        (equal? #t #t)
    )
)

;;;;;;;;;;;;;;;;;;; Total Exercise tests
;;utility method to print the error and return false, or just return true
;; clr = Call Log Return
(define (clr test_func ex_num prob_num)
    (if
        (not test_func)
        (
            (write (~a "TEST FAILURE: Exercise " ex_num " problem " prob_num))
            #f
        )
        #t
    )
)
;; Functions to check that all problems within each exercise pass tests
(define test_ex1
    (and
        (clr test_ex1p1 1 1)
        (clr test_ex1p2 1 2)
        (clr test_ex1p3 1 3)
        (clr test_ex1p4 1 4)
        (clr test_ex1p5 1 5)
        (clr test_ex1p6 1 6)
        (clr test_ex1p7 1 7)
        (clr test_ex1p8 1 8)
        (clr test_ex1p9 1 9)
        (clr test_ex1p10 1 10)
    )
)
(define test_ex2
    (and
        (clr test_ex2p1 2 1)
        (clr test_ex2p2 2 2)
        (clr test_ex2p3 2 3)
    )
)
(define test_ex3
    (and
        (clr test_ex3p1 3 1)
        (clr test_ex3p2 3 2)
        (clr test_ex3p3 3 3)
        (clr test_ex3p4 3 4)
        (clr test_ex3p5 3 5)
        (clr test_ex3p6 3 6)
    )
)
(define test_ex4
    (and
        (clr test_ex4p1 4 1)
        (clr test_ex4p2 4 2)
    )
)
;;;;;;;;;;;;;;;;;;; Total tests
;; Another utility - this one just for exercises
(define (clr2 test_func ex_num)
    (if
        (not test_func)
        (
            (write (~a "TEST FAILURE: Exercise " ex_num))
            #f
        )
        #t
    )
)

;; Test that all exercises work
(define test_all
    (if
        (and
            (clr2 test_ex1 1)
            (clr2 test_ex2 2)
            (clr2 test_ex3 3)
            (clr2 test_ex4 4)
        )
        #t
        #f
    )
)

(if
    test_all
    "All tests passed!"
    "Tests failed!"
)
