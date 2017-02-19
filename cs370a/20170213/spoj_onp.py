# http://www.spoj.com/problems/ONP/

def transform(exp):
    output = ""
    opStack = []

    while(len(exp) > 0):
        token = exp[0]
        exp = exp[1:]

        #character arguments
        if token.islower(): output = output + token
        #left paren or operator
        elif token in '(^/*-+': opStack.append(token)
        #right parenthesis
        elif token == ')':
            stackTop = opStack.pop()
            while stackTop != '(':
                output = output + stackTop
                stackTop = opStack.pop()
        #invalid charactor
        else: print "ERROR"

    #empty out the remaining stack
    if '(' in opStack:
        print "Hey! There shouldn't be any left parentheses in the stack anymore!"
    while(len(opStack) > 0):
        stackTop = opStack.pop()
        output = output + stackTop


    return output

def runMain():
    test_count = raw_input()
    for i in range(int(test_count)):
        exp = raw_input()
        print transform(exp)

def runTests():
    tests = {
    "(a+(b*c))": "abc*+", \
    "((a+b)*(z+x))": "ab+zx+*", \
    "((a+t)*((b+(a+c))^(c+d)))": "at+bac++cd+^*", \
    "a": "a", \
    "a+b": "ab+", \
    "a-b": "ab-", \
    "a*b": "ab*", \
    "a/b": "ab/", \
    "a^b": "ab^", \
    "a+b-c*d/e^f": "abcdef^/*-+", \
    "(((((a+b)-c)*d)/e)^f)": "ab+c-d*e/f^", \
    "a^b/c*d-e+f": "ab^c/d*e-f+", \
    "(((((a^b)/c)*d)-e)+f)": "ab^c/d*e-f+", \
    "((((((a))))))": "a", \
    "((a+b)*(c-d))": "ab+cd-*" \
    }
    for exp in tests:
        expected = tests[exp]
        actual = transform(exp)
        if expected == actual:
            print "Test passed!"
        else:
            print "TEST FAILED!"
            print "\tInput:{0}".format(exp)
            print "\tExpected:{0}".format(expected)
            print "\tActual:{0}".format(actual)

runTests()
