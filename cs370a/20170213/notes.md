[Warmup](http://www.spoj.com/problems/ONP/) - convert infix to postfix

**Shunting-yard algorithm**
```
a+(b*c)     #a to output
    output: a
+(b*c)      #+ to stack
    output: a
    stack: +
(b*c)       #( to stack
    output: a
    stack: +, (
b*c)        #b to output
    output: ab
    stack: +, (
*c)         #* to stack
    output: ab
    stack: +, (, *
c)          #c to output
    output: abc
    stack: +, (, *
)           #) found! Add operators until left-paren is found
    output: abc*
    stack: +
#operators still in stack!
    output: abc*+
    stack:
#stack empty - done
```

Test cases:
Input|Output
:--|:--
(a+(b*c))|abc*+
((a+b)*(z+x))|ab+zx+*
((a+t)*((b+(a+c))^(c+d)))|at+bac++cd+^*
--|--
a|a
a+b|ab+
a-b|ab-
a*b|ab*
a/b|ab/
a^b|ab^
--|--
a+b-c*d/e^f|abcdef^/*-+
(((((a+b)-c)*d)/e)^f)|ab+c-d*e/f^
a^b/c*d-e+f|ab^c/d*e-f+
(((((a^b)/c)*d)-e)+f)|ab^c/d*e-f+
--|--
((((((a))))))|a
((a+b)*(c-d))|ab+cd-*


>To check priority:
When we find a right paren and are popping the stack until finding the left paren, check order of those output.
OR maybe check order of last operator on stack, and if the new one is a higher priority then add it to the output before the last character added

---

**Homework for the week**

[Project Euler - large sum](https://projecteuler.net/problem=13)

Work out the first ten digits of the sum of 100 50-digit numbers

Javascript is allowed, but make it clear how to run it.
