#lang racket
(require eopl/eopl)
;;  Josh Gribbon
;;  CS496A - Programming Languages
;;  Homework 2
;;  I pledge my honor I have abided by the Stevens Honor System. ~Josh Gribbon

;; Problem 1
(define-datatype dTree dTree?
    (leaf-t (n number?))
    (node-t (id symbol?) (l dTree?) (r dTree?)))


;; Problem 2
;;dTree
(define t1
    (node-t 'w
        (node-t 'x (leaf-t 2) (leaf-t 5))
        (leaf-t 8)))
;;dTree
(define t2
    (node-t 'w
        (node-t 'x (leaf-t 2) (leaf-t 5))
        (node-t 'y (leaf-t 7) (leaf-t 5))))


;; Problem 3
;; a)
;; dTree -> num
(define (dTree-height dt)
    (cases dTree dt
        (leaf-t (n)
            0)
        (node-t (id lt rt)
            (+ 1 (max
                (dTree-height lt)
                (dTree-height rt))))))
;; b)
;; dTree -> num
(define (dTree-size dt)
    (cases dTree dt
        (leaf-t (n)
            1)
        (node-t (id lt rt)
            (+ 1
                (dTree-size lt)
                (dTree-size rt)))))
;; c)
;; dTree -> [[num]]
(define (dTree-paths dt)
    (cases dTree dt
        (leaf-t (n)
            null)
        (node-t (id lt rt)
            (define (prepend-list xs n)
                (if (null? xs)
                    (list n)
                    (map (lambda (x) (append (list n) x))
                        xs)))
            (append
                (prepend-list (dTree-paths lt) 0)
                (prepend-list (dTree-paths rt) 1)))))
;; d)
;; dTree -> bool
(define (dTree-perfect? dt)
    (define (balanceHelper dt)
        (cases dTree dt
            (leaf-t (n)
                1)
            (node-t (id lt rt)
                (if (eq?
                        (balanceHelper lt)
                        (balanceHelper rt))
                    (+ (balanceHelper lt) (balanceHelper rt))
                    0))))
    (cases dTree dt
        (leaf-t (n)
            #t)
        (node-t (id lt rt)
            (if (eq? (balanceHelper lt) (balanceHelper rt))
                #t
                #f))))
;; e)
;; {(sym->sym) (num->num) dTree} -> dTree
(define (dTree-map symFn numFn dt)
    (cases dTree dt
        (leaf-t (n)
            (leaf-t (numFn n)))
        (node-t (id lt rt)
            (node-t
                (symFn id)
                (dTree-map symFn numFn lt)
                (dTree-map symFn numFn rt)))))


;; Problem 4
;; [a] -> dTree
(define (list->tree symLst)
    (if (null? symLst)
        (leaf-t 0)
        (node-t (identity (car symLst)) (list->tree (cdr symLst)) (list->tree (cdr symLst)))))


;; Problem 5
;; maps := ([num] num)
;; {dTree [maps]} -> dTree
(define (replaceLeafAt dt g)
    ;; helper that takes in the the path so far
    ;; when its just a leaf then find the mapping for the path
    ;; return the leaf with that value
    ;; to recurse make two more calls in both paths
    (define (compLst l1 l2)
        (cond
            [(and (null? l1) (null? l2)) #t]
            [(eq? (car l1) (car l2)) (compLst (cdr l1) (cdr l2))]
            [else #f]))
    (define (replaceHelper dth gh p)
        (print p)
        (cases dTree dth
            (leaf-t (n)
                (leaf-t
                    (memf
                        (lambda (x) (compLst p (car x)))
                        gh)))
            (node-t (id lt rt)
                (node-t
                    id
                    (replaceHelper lt gh (append (list 0) p))
                    (replaceHelper rt gh (append (list 1) p))))))
    (replaceHelper dt g '()))
(define t3
    (node-t 'a
        (node-t 'b
            (node-t 'c (leaf-t 9) (leaf-t 9))
            (node-t 'd (leaf-t 9) (leaf-t 9))
        )
        (node-t 'e
            (node-t 'f (leaf-t 9) (leaf-t 9))
            (node-t 'g (leaf-t 9) (leaf-t 9)))))
(define g1 '(
    ((0 0 0) . 0)
    ((0 0 1) . 1)
    ((0 1 0) . 1)
    ((0 1 1) . 0)
    ((1 0 0) . 1)
    ((1 0 1) . 0)
    ((1 1 0) . 0)
    ((1 1 1) . 1)))
(replaceLeafAt t3 g1)


;; Problem 6
;; TYPE
(define (df->dTree bf)
    t1
)
