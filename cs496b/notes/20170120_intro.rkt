#lang racket

;;simple function
(define l2
  '(1 2 3 4)
)

;;how to show types here? Just put a comment
;;num -> num
(define (succ n)
  (+ n 1))

;;num -> num -> num
(define (mult n m)
  (* n m))

;;heres a little function to add an element to the end of the list
(define (snoc xs x)
  (append xs (list x)))

;;this will return a pair (list, number)
;;lists in scheme are pairs of elements and lists, with the last element being
;;  the empty list
(define (snoc2 xs x)
  (append xs x))

;;[a] -> (a -> [a] )
;;takes in list of type 'a', returns a function that takes element of type 'a',
;;  and returns a list of elements of type 'a'
(define snoc3
  (lambda (xs)
    (lambda (x)
      (append xs (list x)))))

;;add 1 to something
(lambda (x) (+ x 1))

;;take function from above and pass it 3, returns 4
((lambda (x) (+ x 1)) 3)

;;takes a function and gives it the input 2
(lambda (f) (f 2))

;;takes the function to add 1, and passes it into the function that gives it the
;;input of 2, returns 3
((lambda (f) (f 2)) (lambda (x) (+ x 1)))

;;function that takes in numbers and adds 2
((lambda (x) (lambda (y) (+ x y))) 2)

;; [a] -> num
(define (len xs)
  (length xs))

;;[num] -> [num]
;;takes in a list of numbers and returns the list with each element incremented
(define (succL xs)
  (match xs
    ['() '()]
    [(cons h t) (cons (+ 1 h) (succL t))]
    [_ (error "succL: cannot handle this case")]
    ))




