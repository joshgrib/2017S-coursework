def ceilDiv(a, b):
    return -(-a // b)

def segPrimeSieve(n, m):
    print "Finding primes from {0} to {1}".format(n, m)
    lst = list(range(2, m+1))
    p = 2
    low_primes = [2]
    while(len(lst) > 0):
        lst = map(lambda x: x if x%p != 0 else "p", lst)
        lst = filter(lambda x: x!="p", lst)
        p = lst[0]
        lst = lst[1:]
        low_primes.append(p)
    print filter(lambda x: (x>=n) & (x<=m), low_primes)

c = int(raw_input())
while(c>0):
    line = raw_input()
    a = line.split()[0]
    b = line.split()[1]
    resLst = segPrimeSieve(a, b)
    for pn in resLst:
        print resLst[pn]
    print ""
