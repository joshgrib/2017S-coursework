"""
1 = 001
2 = 010
4 = 100

Go through ints
Find largest significant bit
Try to trail 0s after, and ensure a 0 before, through 2 1s or 2 0s

Idea: take largest number, XOR with things to fill it's spots
"""

"""READ INPUT
ints = []
num_count = int(input())
for i in range(num_count):
    ints.append(int(input()))
"""

def getNextPowerOf2(n):
    #get the largest power of 2 below n
    po2 = 1
    while (po2*2) < n:
        po2 *= 2
    return po2

def blockByPowersOf2(xs):
    res_lst = []
    if len(xs) == 0:
        return [[]]
    xs.sort(reverse=True)
    next_po2 = getNextPowerOf2(xs[0])
    acc_lst = []
    for x in xs:
        if x > next_po2:
            #if still above next power of 2, add to accumulator list
            acc_lst.append(x)
        else:
            #if we're in the next block, add acc_lst to res_lst, reset acc_lst, and update the next power of 2
            res_lst.append(acc_lst)
            acc_lst = [x]
            next_po2 = getNextPowerOf2(x)
    res_lst.append(acc_lst)
    return res_lst

def getMaxXorSubset(xs):
    xs_blocked = blockByPowersOf2(xs)
    accum = max(xs_blocked[0])
    for i in range(1, len(xs_blocked)):
        accum ^= max(xs_blocked[i])
    return accum

xs = [1, 2, 4]
print getMaxXorSubset(xs)
