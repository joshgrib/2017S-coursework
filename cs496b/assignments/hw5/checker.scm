(module checker (lib "eopl.ss" "eopl")

  (require "drscheme-init.scm")
  (require "lang.scm")

  (provide type-of type-of-program)

  ;; check-equal-type! : Type * Type * Exp -> Unspecified
  ;; Page: 242
  (define check-equal-type!
    (lambda (ty1 ty2 exp)
      (when (not (equal? ty1 ty2))
        (report-unequal-types ty1 ty2 exp))))

  ;; report-unequal-types : Type * Type * Exp -> Unspecified
  ;; Page: 243
  (define report-unequal-types
    (lambda (ty1 ty2 exp)
      (eopl:error 'check-equal-type!
          "Types didn't match: ~s != ~a in~%~a"
          (type-to-external-form ty1)
          (type-to-external-form ty2)
          exp)))

  ;;;;;;;;;;;;;;;; The Type Checker ;;;;;;;;;;;;;;;;

  ;; type-of-program : Program -> Type
  ;; Page: 244
  (define type-of-program
    (lambda (pgm)
      (cases program pgm
        (a-program (exp1) (type-of exp1 (init-tenv))))))

  ;; type-of : Exp * Tenv -> Type
  ;; Page 244--246
  (define type-of
    (lambda (exp tenv)
      (cases expression exp

        ;; \commentbox{\hastype{\tenv}{\mv{num}}{\mathtt{int}}}
        (const-exp (num) (int-type))

        ;; \commentbox{\hastype{\tenv}{\var{}}{\tenv{}(\var{})}}
        (var-exp (var) (apply-tenv tenv var))

        ;; \commentbox{\diffrule}
        (diff-exp (exp1 exp2)
          (let ((ty1 (type-of exp1 tenv))
                (ty2 (type-of exp2 tenv)))
            (check-equal-type! ty1 (int-type) exp1)
            (check-equal-type! ty2 (int-type) exp2)
            (int-type)))

        ;; \commentbox{\zerorule}
        (zero?-exp (exp1)
          (let ((ty1 (type-of exp1 tenv)))
            (check-equal-type! ty1 (int-type) exp1)
            (bool-type)))

        ;; \commentbox{\condrule}
        (if-exp (exp1 exp2 exp3)
          (let ((ty1 (type-of exp1 tenv))
                (ty2 (type-of exp2 tenv))
                (ty3 (type-of exp3 tenv)))
            (check-equal-type! ty1 (bool-type) exp1)
            (check-equal-type! ty2 ty3 exp)
            ty2))

        ;; \commentbox{\letrule}
        (let-exp (var exp1 body)
          (let ((exp1-type (type-of exp1 tenv)))
            (type-of body
              (extend-tenv var exp1-type tenv))))

        ;; \commentbox{\procrulechurch}
        (proc-exp (var var-type body)
          (let ((result-type
                  (type-of body
                    (extend-tenv var var-type tenv))))
            (proc-type var-type result-type)))

        ;; \commentbox{\apprule}
        (call-exp (rator rand)
          (let ((rator-type (type-of rator tenv))
                (rand-type  (type-of rand tenv)))
            (cases type rator-type
              (proc-type (arg-type result-type)
                (begin
                  (check-equal-type! arg-type rand-type rand)
                  result-type))
              (else
                (report-rator-not-a-proc-type rator-type rator)))))

        ;; \commentbox{\letrecrule}
        (letrec-exp (p-result-type p-name b-var b-var-type p-body
                      letrec-body)
          (let ((tenv-for-letrec-body
                  (extend-tenv p-name
                    (proc-type b-var-type p-result-type)
                    tenv)))
            (let ((p-body-type
                    (type-of p-body
                      (extend-tenv b-var b-var-type
                        tenv-for-letrec-body))))
              (check-equal-type!
                p-body-type p-result-type p-body)
              (type-of letrec-body tenv-for-letrec-body))))

        ;; new for hw5
        ;;      tenv|-e::t
        ;;=======================
        ;;tenv|-newref(e)::ref(t)
        (newref-exp (exp1)
          (let ((t1 (type-of exp1 tenv)))
            (ref-type t1)))
        ;;new for hw 5
        ;; tenv|-e::ref(t)
        ;;=================
        ;;tenv|-deref(e)::t
        (deref-exp (exp1)
          (let ((t1 (type-of exp1 tenv)))
            (cases type t1
              (ref-type (rt)
                rt)
              (else (eopl:error "Improper type for deref-exp: not a ref-type")))))
        ;;new for hw 5
        ;;tenv|-e1::ref(t)   tenv|-e2::t
        ;;==============================
        ;;   tenv|-setref(e1,e2)::unit
        (setref-exp (exp1 exp2)
          (let ((t1 (type-of exp1 tenv))
                (t2 (type-of exp2 tenv)))
            (cases type t1
              (ref-type (rt)
                (check-equal-type! rt t2 (setref-exp (exp1 exp2)))
                (unit-type))
              (else (eopl:error "Improper type for setref-exp: not a ref-type")))))
        ;;new for hw 5
        ;;tenv|-e1::t1   tenv|-e2::t2
        ;;===========================
        ;;tenv|-pair(e1,e2)::<t1*t2>
        (pair-exp (exp1 exp2)
          (let ((t1 (type-of exp1 tenv))
                (t2 (type-of exp2 tenv)))
            (pair-type t1 t2)))
        ;;new for hw 5
        ;;tenv2 = tenv + {id1:t1, id2:t2}
        ;; tenv|-exp1::<t1*t2>   tenv2|-e2::t0
        ;;======================================
        ;;tenv|-unpair(id1,id2)=exp1 in body::t0
        (unpair-exp (id1 id2 exp1 body)
          (let ((ptype (type-of exp1 tenv)))
            (cases type ptype
              (pair-type (t1 t2)
                (type-of
                  body
                  (extend-tenv id1 t1 (extend-tenv id2 t2 tenv))))
              (else (eopl:error "Improper type for unpair-exp: not a pair-type")))))
        ;;new for hw 5
        ;;
        ;;==========================
        ;;tenv|-emptylist t::list(t)
        (emptylist-exp (t1)
          (list-type t1))
        ;;new for hw 5
        ;;tenv|-e1::t   tenv|-e2::list(t)
        ;;===============================
        ;;   tenv|-cons(e1,e2)::list(t)
        (cons-exp (exp1 exp2)
          (let ((t1 (type-of exp1 tenv))
                (t2 (type-of exp2 tenv)))
            (check-equal-type! t2 (list-type t1) exp2)
            (list-type t1)))
        ;;new for hw 5
        ;;  tenv|-e::list(t)
        ;;====================
        ;;tenv|-null?(e)::bool
        (null?-exp (exp1)
          (let ((t1 (type-of exp1 tenv)))
            (cases type t1
              (list-type (lt)
                (check-equal-type! t1 (list-type lt) exp1)
                (bool-type))
              (else (eopl:error "Improper type for null?-exp: not a list-type")))))
        ;;new for hw 5
        ;;tenv|-e::list(t)
        ;;================
        ;; tenv|-car(e)::t
        (car-exp (exp1)
          (let ((t1 (type-of exp1 tenv)))
            (cases type t1
              (list-type (lt)
                (check-equal-type! t1 (list-type lt) exp1)
                lt)
              (else (eopl:error "Improper type for car-exp: not a list-type")))))
        ;;new for hw 5
        ;;  tenv|-e::list(t)
        ;;=====================
        ;;tenv|-cdr(e)::list(t)
        (cdr-exp (exp1)
          (let ((t1 (type-of exp1 tenv)))
            (cases type t1
              (list-type (lt)
                (check-equal-type! t1 (list-type lt) exp1)
                (list-type lt))
              (else (eopl:error "Improper type for cdr-exp: not a list-type")))))
        ;;new for hw 5
        ;;
        ;;==========================
        ;;tenv|-emptytree t::tree(t)
        (emptytree-exp (t1)
          (tree-type t1))
        ;;new for hw 5
        ;;tenv|-e1::t   tenv|-e2::tree(t)   tenv|-e3::tree(t)
        ;;===================================================
        ;;         tenv|-node(e1,e2,e3)::tree(t)
        (node-exp (exp1 exp2 exp3)
          (let ((t1 (type-of exp1 tenv))
                (t2 (type-of exp2 tenv))
                (t3 (type-of exp3 tenv)))
            (check-equal-type! t2 (tree-type t1) exp2)
            (check-equal-type! t3 (tree-type t1) exp3)
            (tree-type t1)))
        ;;new for hw 5
        ;;  tenv|-e::tree(t)
        ;;=====================
        ;;tenv|-nullT?(e)::bool
        (nullT?-exp (exp1)
          (let ((t1 (type-of exp1 tenv)))
            (cases type t1
              (tree-type (tt)
                (check-equal-type! t1 (tree-type tt))
                (bool-type))
              (else (eopl:error "Improper type for nullT?-exp: not a tree-type")))))
        ;;new for hw 5
        ;; tenv|-e::tree(t)
        ;;===================
        ;;tenv|-getData(e)::t
        (getData-exp (exp1)
          (let ((t1 (type-of exp1 tenv)))
            (cases type t1
              (tree-type (tt)
                (check-equal-type! t1 (tree-type tt))
                tt)
              (else (eopl:error "Improper type for getData-exp: not a tree-type")))))
        ;;new for hw 5
        ;;   tenv|-e::tree(t)
        ;;========================
        ;;tenv|-getLST(e)::tree(t)
        (getLST-exp (exp1)
          (let ((t1 (type-of exp1 tenv)))
            (cases type t1
              (tree-type (tt)
                (check-equal-type! t1 (tree-type tt))
                (tree-type tt))
              (else (eopl:error "Improper type for getLST-exp: not a tree-type")))))
        ;;new for hw 5
        ;;   tenv|-e::tree(t)
        ;;=======================
        ;;tenv|-getRST(e)::tree(t)
        (getRST-exp (exp1)
          (let ((t1 (type-of exp1 tenv)))
            (cases type t1
              (tree-type (tt)
                (check-equal-type! t1 (tree-type tt))
                (tree-type tt))
              (else (eopl:error "Improper type for getRST-exp: not a tree-type")))))
        ;;new for hw 5
        (showstore-exp ()
          (eopl:error "part of stub but not part of assignment."))
        ;;new for hw 5
        (begin-exp (e exps)
          (eopl:error "part of stub but not part of assignment."))
        ;;new for hw 5
        (for-exp (id lb up body)
          (eopl:error "part of stub but not part of assignment."))
      )
    )
  )

  (define report-rator-not-a-proc-type
    (lambda (rator-type rator)
      (eopl:error 'type-of-expression
        "Rator not a proc type:~%~s~%had rator type ~s"
           rator
           (type-to-external-form rator-type))))

  ;;;;;;;;;;;;;;;; type environments ;;;;;;;;;;;;;;;;

  (define-datatype type-environment type-environment?
    (empty-tenv-record)
    (extended-tenv-record
      (sym symbol?)
      (type type?)
      (tenv type-environment?)))

  (define empty-tenv empty-tenv-record)
  (define extend-tenv extended-tenv-record)

  (define apply-tenv
    (lambda (tenv sym)
      (cases type-environment tenv
        (empty-tenv-record ()
          (eopl:error 'apply-tenv "Unbound variable ~s" sym))
        (extended-tenv-record (sym1 val1 old-env)
          (if (eqv? sym sym1)
            val1
            (apply-tenv old-env sym))))))

  (define init-tenv
    (lambda ()
      (extend-tenv 'x (int-type)
        (extend-tenv 'v (int-type)
          (extend-tenv 'i (int-type)
            (empty-tenv))))))

  )
