#!/bin/python

import sys

def sumHourGlass(arr, x, y):
    sum = 0
    tl = arr[x][y]
    tc = arr[x][y+1]
    tr = arr[x][y+2]
    cc = arr[x+1][y+1]
    bl = arr[x+2][y]
    bc = arr[x+2][y+1]
    br = arr[x+2][y+2]
    #print "{0} {1} {2}\ n  {3}  \n{4} {5} {6}".format(tl, tc, tr, cc, bl, bc, br)
    return tl + tc + tr + cc + bl + bc + br

arr = []
for arr_i in xrange(6):
    arr_temp = map(int,raw_input().strip().split(' '))
    arr.append(arr_temp)

#print str(arr)
maxSum = -999999999999999999999999999999999999999
for x in range(len(arr) - 3):
    for y in range(len(arr[0]) - 3):
        tl = arr[x][y]
        tc = arr[x][y+1]
        tr = arr[x][y+2]
        cc = arr[x+1][y+1]
        bl = arr[x+2][y]
        bc = arr[x+2][y+1]
        br = arr[x+2][y+2]
        sum = tl + tc + tr + cc + bl + bc + br#sumHourGlass(arr, i, j)
        if sum > maxSum:
            maxSum = sum
            #print "New sum {0} found at arr[{1}][{2}]".format(maxSum, i, j)

print maxSum
