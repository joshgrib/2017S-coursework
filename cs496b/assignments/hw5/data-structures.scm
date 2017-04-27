(module data-structures (lib "eopl.ss" "eopl")

  (require "lang.scm")                  ; for expression?
  (require "store.scm")                 ; for reference?

  (provide (all-defined-out))               ; too many things to list

;;;;;;;;;;;;;;;; expressed values ;;;;;;;;;;;;;;;;

  (define-datatype expval expval?
    (num-val
      (value number?))
    (bool-val
      (boolean boolean?))
    (proc-val
      (proc proc?))
    (ref-val
      (ref reference?))
    (unit-val)
    (pair-val
      (fst expval?)
      (snd expval?))
    (list-val
      (lst list?))
    (tree-val
      (node expval?)
      (lst expval?)
      (rst expval?))
    (emptytree)
  )

;;; extractors:

  (define expval->num
    (lambda (v)
      (cases expval v
	      (num-val (num) num)
	      (else (expval-extractor-error 'num v)))))

  (define expval->bool
    (lambda (v)
      (cases expval v
	      (bool-val (bool) bool)
	      (else (expval-extractor-error 'bool v)))))

  (define expval->proc
    (lambda (v)
      (cases expval v
        (proc-val (proc) proc)
        (else (expval-extractor-error 'proc v)))))

  (define expval->ref
    (lambda (v)
      (cases expval v
        (ref-val (ref) ref)
        (else (expval-extractor-error 'reference v)))))

  ;;new for hw 5
  (define expval->fst
    (lambda (v)
      (cases expval v
        (pair-val (e1 e2) e1)
        (else (expval-extractor-error 'pair v)))))
  ;;new for hw 5
  (define expval->snd
    (lambda (v)
      (cases expval v
        (pair-val (e1 e2) e2)
        (else (expval-extractor-error 'pair v)))))

  ;;new for hw 5
  (define expval->null?
    (lambda (l)
      (cases expval l
        (list-val (l) (null? l))
        (else (expval-extractor-error 'list l)))))
  ;;new for hw 5
  (define expval->car
    (lambda (l)
      (cases expval l
        (list-val (l) (car l))
        (else (expval-extractor-error 'list l)))))
  ;;new for hw 5
  (define expval->cdr
    (lambda (l)
      (cases expval l
        (list-val (l) (list-val (cdr l)))
        (else (expval-extractor-error 'list l)))))

  ;;new for hw 5
  (define expval->nullT?
    (lambda (t)
      (cases expval t
        (tree-val (n lst rst) #f)
        (emptytree () #t)
        (else (expval-extractor-error 'tree t)))))
  ;;new for hw 5
  (define expval->getData
    (lambda (t)
      (cases expval t
        (tree-val (n lst rst)
          n)
        (emptytree () (unit-val))
        (else (expval-extractor-error 'tree t)))))
  ;;new for hw 5
  (define expval->getLST
    (lambda (t)
      (cases expval t
        (tree-val (n lst rst)
          lst)
        (emptytree () (unit-val))
        (else (expval-extractor-error 'tree t)))))
  ;;new for hw 5
  (define expval->getRST
    (lambda (t)
      (cases expval t
        (tree-val (n lst rst)
          rst)
        (emptytree () (unit-val))
        (else (expval-extractor-error 'tree t)))))

  (define expval-extractor-error
    (lambda (variant value)
      (eopl:error 'expval-extractors "Looking for a ~s, found ~s"
	     variant value)))

;;;;;;;;;;;;;;;; procedures ;;;;;;;;;;;;;;;;

  (define-datatype proc proc?
    (procedure
      (bvar symbol?)
      (body expression?)
      (env environment?)))

  (define-datatype environment environment?
    (empty-env)
    (extend-env
      (bvar symbol?)
      (bval expval?)
      (saved-env environment?))
    (extend-env-rec*
      (proc-names (list-of symbol?))
      (b-vars (list-of symbol?))
      (proc-bodies (list-of expression?))
      (saved-env environment?)))

  ;; env->list : Env -> List
  ;; used for pretty-printing and debugging
  (define env->list
    (lambda (env)
      (cases environment env
	(empty-env () '())
	(extend-env (sym val saved-env)
	  (cons
	    (list sym (expval->printable val))
	    (env->list saved-env)))
	(extend-env-rec* (p-names b-vars p-bodies saved-env)
	  (cons
	    (list 'letrec p-names '...)
	    (env->list saved-env))))))

  ;; expval->printable : ExpVal -> List
  ;; returns a value like its argument, except procedures get cleaned
  ;; up with env->list
  (define expval->printable
    (lambda (val)
      (cases expval val
	(proc-val (p)
	  (cases proc p
	    (procedure (var body saved-env)
	      (list 'procedure var '... (env->list saved-env)))))
	(else val))))


)
