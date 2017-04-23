(module lang (lib "eopl.ss" "eopl")

  ;; language for EXPLICIT-REFS

  (require "drscheme-init.scm")

  (provide (all-defined-out))

  ;;;;;;;;;;;;;;;; grzq ammatical specification ;;;;;;;;;;;;;;;;

  (define the-lexical-spec
    '((whitespace (whitespace) skip)
      (comment ("%" (arbno (not #\newline))) skip)
      (identifier
       (letter (arbno (or letter digit "_" "-" "?")))
       symbol)
      (number (digit (arbno digit)) number)
      (number ("-" digit (arbno digit)) number)
      ))

  (define the-grammar
    '(
      (program (expression) a-program)

      (expression
        ("showstore")
        showstore-exp)

      (expression (number) const-exp)

      (expression
        ("-" "(" expression "," expression ")")
        diff-exp)

      (expression
        ("zero?" "(" expression ")")
        zero?-exp)

      (expression
        ("if" expression "then" expression "else" expression)
        if-exp)

      (expression (identifier) var-exp)

      (expression
        ("let" identifier "=" expression "in" expression)
        let-exp)

      (expression
        ("proc" "(" identifier ":" type ")" expression)
        proc-exp)

      (expression
        ("(" expression expression ")")
        call-exp)

      (expression
        ("letrec" type identifier "(" identifier ":" type ")" "=" expression
          "in" expression)
        letrec-exp)

      ;; new for explicit-refs

      (expression
        ("begin" expression (arbno ";" expression) "end")
        begin-exp)

      (expression
        ("newref" "(" expression ")")
        newref-exp)

      (expression
        ("deref" "(" expression ")")
        deref-exp)

      (expression
        ("setref" "(" expression "," expression ")")
        setref-exp)

      (expression
        ("for" identifier "=" expression "to" expression "(" expression ")")
        for-exp)

      (type
        ("int")
        int-type)

      (type
        ("bool")
        bool-type)

      (type
        ("(" type "->" type ")")
        proc-type)

      ;; new for hw5
      (type
        ("unitE")
        unit-type)
      ;;new for hw 5
      (type
        ("ref" "(" type ")")
        ref-type)
        
      ;;new for hw 5
      (expression
        ("pair" "(" expression "," expression ")")
        pair-exp)
      ;;new for hw 5
      (expression
        ("unpair" "(" identifier "," identifier ")" "=" expression
          "in" expression)
        unpair-exp)
      ;;new for hw 5
      (type
        ("<" type "*" type ">")
        pair-type)

      ;;new for hw 5
      (expression
        ("emptylist" type)
        emptylist-exp)
      ;;new for hw 5
      (expression
        ("cons" "(" expression "," expression ")")
        cons-exp)
      ;;new for hw 5
      (expression
        ("null?" "(" expression ")")
        null?-exp)
      ;;new for hw 5
      (expression
        ("car" "(" expression ")")
        car-exp)
      ;;new for hw 5
      (expression
        ("cdr" "(" expression ")")
        cdr-exp)
      ;;new for hw 5
      (type
        ("list" "(" type ")")
        list-type)

      ;;new for hw 5
      (expression
        ("emptytree" type)
        emptytree-exp)
      ;;new for hw 5
      (expression
        ("node" "(" expression "," expression "," expression ")")
        node-exp)
      ;;new for hw 5
      (expression
        ("nullT?" "(" expression ")")
        nullT?-exp)
      ;;new for hw 5
      (expression
        ("getData" "(" expression ")")
        getData-exp)
      ;;new for hw 5
      (expression
        ("getLST" "(" expression ")")
        getLST-exp)
      ;;new for hw 5
      (expression
        ("getRST" "(" expression ")")
        getRST-exp)
      ;;new for hw 5
      (type
        ("tree" "(" type ")")
        tree-type)
    )
  )

  ;;;;;;;;;;;;;;;; sllgen boilerplate ;;;;;;;;;;;;;;;;

  (sllgen:make-define-datatypes the-lexical-spec the-grammar)

  (define show-the-datatypes
    (lambda () (sllgen:list-define-datatypes the-lexical-spec the-grammar)))

  (define scan&parse
    (sllgen:make-string-parser the-lexical-spec the-grammar))

  (define just-scan
    (sllgen:make-string-scanner the-lexical-spec the-grammar))

  ;;;;;;;;;;;;;;;; type-to-external-form ;;;;;;;;;;;;;;;;

  ;; type-to-external-form : Type -> List
  ;; Page: 243
  (define type-to-external-form
    (lambda (ty)
      (cases type ty
        (int-type () 'int)
        (bool-type () 'bool)
        (proc-type (arg-type result-type)
                   (list
                    (type-to-external-form arg-type)
                    '->
                    (type-to-external-form result-type)))
        ;;new for hw 5
        (ref-type (e-type)
          (list 'ref (type-to-external-form e-type)))
        ;;new for hw 5
        (unit-type () 'unit)
        ;;new for hw 5
        (pair-type (t1 t2)
          ;;> (type-to-external-form (pair-type (int-type) (bool-type)))
          ;;'(< int * bool >)
          (list
            '<
            (type-to-external-form t1)
            '*
            (type-to-external-form t2)
            '>
          )
        )
        ;;new for hw 5
        (list-type (t1)
          (list 'list (type-to-external-form t1)))
        ;;new for hw 5
        (tree-type (t1)
          (list 'tree (type-to-external-form t1)))
      )
    )
  )
)
