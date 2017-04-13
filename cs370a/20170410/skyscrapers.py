"""
* constant descending - keep adding to stack, no paths
* constant increasing - keep discarding stack and adding new, no paths
* constant   level    - keep adding to stack, take
"""

hStack = []
buildingArr = [3, 2, 1, 2, 3, 3]
pathCount = 0

prevH = buildingArr[0]
hStack.append(prevH)

for i in buildingArr[1:]:
    print
    h = i
    print "     h:{}\n prevH:{}\nhStack:{}".format(h, prevH, hStack)
    if h < prevH:
        #less = add to stack
        hStack.append(h)
    elif h == prevH:
        #equal = add to stack
        hStack.append(h)
    elif h > prevH:
        #greater, stack removal
        stackTop = hStack[-1]
        sameCount = 0
        while(stackTop <= h):
            if stackTop == h:
                sameCount = sameCount + 1
            hStack = hStack[:-1]
            if len(hStack) > 0:
                stackTop = hStack[-1]
            else:
                stackTop = -1
        print "sc:{}".format(sameCount)
        #clear stack, new height, check for matches during removal
    prevH = h
print "     h:{}\n prevH:{}\nhStack:{}".format(h, prevH, hStack)
print pathCount
