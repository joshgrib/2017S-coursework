# Lambda Calculus
* Created by Alonzo Church in 1932
* Basically the essence of all Functional Programming Lnaguages distilled down
* Turing was his PhD student, and they proved that lambda calculus is Turing complete and can ahndle anything a Turing machine can

**Lambda calculus is awesome for modeling certain programming situations in a concise and simple way**

>Examples: Scoping, type checking and inference, garbage collection

```
(λ x.x + x)((λ y.2 * y)4)
(λ x.x + x)(8)
(16)
```

---

## Syntax
```
<exp>   :== <identifier>          
         |  λ<identifier>.<exp>   
         |  (<exp> <exp>)         
```
* `<identifier>` for variable assignment
* `λ<identifier>.<exp>` for function abstraction
* `(<exp> <exp>)` for application
