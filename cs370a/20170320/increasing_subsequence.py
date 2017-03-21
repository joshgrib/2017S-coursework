exInLen = 5
exIn = [2, 7, 4, 3, 8]
exOut = 3

def LIS(arr):
    '''
    An O(n^2) solution
    '''
    n = len(arr)
    lis = [1]*n
    for i in range (1 , n):
        for j in range(0 , i):
            if arr[i] > arr[j] and lis[i]< lis[j] + 1 :
                lis[i] = lis[j]+1
    maxLen = 0
    for i in range(n):
        maxLen = max(maxLen , lis[i])
    return maxLen

'''
    THE ALGORITHM for O(nlogn)
    1. If A[i] is smallest among all end
       candidates of active lists, we will start
       new active list of length 1.
    2. If A[i] is largest among all end candidates of
      active lists, we will clone the largest active
      list, and extend it by A[i].
    3. If A[i] is in between, we will find a list with
      largest end element that is smaller than A[i].
      Clone and extend this list by A[i]. We will discard all
      other lists of same length as that of this modified list.
'''
exIn = [2, 7, 4, 3, 8]
def LIS_fast(arr):
    listTracker = [[arr[0]]]
    for i in range(1, len(arr)):
        smallest = True
        largest = True
        largestList = listTracker[0]
        for subLst in listTracker:
            if subLst[-1] < arr[i]:
                smallest = False
            if subLst[-1] > arr[i]:
                largest = False
            if len(subLst) > len(largestList):
                largestList = subLst
        if smallest:
            listTracker.append([arr[i]])
        elif largest:
            newLst = largestList.append(arr[i])
        else:
            maxEndElemLst = listTracker[0]
            for subLst in listTracker:
                if subLst[-1] < arr[i]:
                    if len(subLst) > len(maxEndElemLst):
                        maxEndElemLst = subLst
            newLst = maxEndElemLst.append(arr[i])
            listTracker = listTracker.filter((lambda x: len(x) != len(newLst)), listTracker)
            listTracker.append(newLst)
    maxLenLst = listTracker[0]
    for lst in listTracker:
        if len(lst) > len(maxLenLst):
            maxLenLst = lst
    return len(maxLenLst)
print LIS_fast(exIn)





inputLength = input()
inArr = []
for i in range(0, inputLength):
    thisNum = input()
    inArr.append(thisNum)

print LIS(inArr)
