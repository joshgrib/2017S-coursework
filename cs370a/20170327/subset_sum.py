import itertools

def subsets(arr):
    all_subsets = []
    for i in range(1, len(arr)):
        subsets = itertools.combinations(arr, i)
        all_subsets += subsets
    return all_subsets

def minNotPossibleSum(arr):
    sums = []
    subsetArr = subsets(arr)
    for subset in subsetArr:
        s = sum(subset)
        if not s in sums:
            sums.append(s)
    print sums
    if len(sums) is 0:
        return 1
    for i in range(1, max(sums)+1):
        if i not in sums:
            return i

print minNotPossibleSum([1])

def getSmallest(arr):
    smallest = 1
    for i in sorted(arr):
        if i <= smallest:
            smallest  += i
        else:
            return i-1
print getSmallest([1, 2, 3, 8])

t_count = int(input())

for i in range(t_count):
    arr_len = int(input())
    arr_str = str(input())
    arr = arr_str.split(' ')
    print minNotPossibleSum(arr)
