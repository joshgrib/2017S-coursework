"""
HackerRank - paint the tiles
https://www.hackerrank.com/contests/hourrank-7/challenges/tile-painting
"""

"""
N tiles N[0] -> N[N-1]
Match to config C, made of R and B
Adjacent tiles can be painted in one stroke
No more than 1 stroke per tile

"""
#!/bin/python

import sys

N = int(raw_input().strip())
C = raw_input().strip()

count = 1
lastLet = C[0]
for letter in C:
    if letter != lastLet:
        count = count + 1
        lastLet = letter
print count
