def LCS(s1, s2):
    if len(s1) is 0 or len(s2) is 0:
        return 0
    if s1[0] == s2[0]:
        return 1 + LCS(s1[1:], s2[1:])
    return max(LCS(s1, s2[1:]), LCS(s1[1:], s2))
#print LCS("hello", "world")
#print LCS("", "world")
#print LCS("hello", "")
#print LCS("abdez", "bed")

def fast_LCS(s1, s2):
    def fast_LCS_helper(s1, s2, memo):
        if (s1, s2) in memo:
            return memo[(s1, s2)]
        if len(s1) is 0 or len(s2) is 0:
            result = 0
        elif s1[0] == s2[0]:
            result = 1 + fast_LCS_helper(s1[1:], s2[1:], memo)
        else:
            result = max(fast_LCS_helper(s1, s2[1:], memo), fast_LCS_helper(s1[1:], s2, memo))
        memo[(s1, s2)] = result
        return result
    return fast_LCS_helper(s1, s2, {})
#print fast_LCS("hello", "world")
#print fast_LCS("", "world")
#print fast_LCS("hello", "")
#print fast_LCS("abdez", "bed")
#print fast_LCS("abdezafsdnklafsdf", "bedsadfsfapfda")

def LCS_with_values(s1, s2):
    if len(s1) is 0 or len(s2) is 0:
        return (0, '')
    if s1[0] == s2[0]:
        result = LCS_with_values(s1[1:], s2[1:])
        return (1+result[0], s1[0]+result[1])
    use_s1 = LCS_with_values(s1[1:], s2)
    use_s2 = LCS_with_values(s1, s2[1:])
    if use_s1[0]>use_s2[0]:
        return use_s1
    return use_s2
#print LCS_with_values("hello", "world")
#print LCS_with_values("", "world")
#print LCS_with_values("hello", "")
#print LCS_with_values("abdez", "bed")


"""CHALLENGE
Instead of longest COMMON subsequence,
get the longest INCREASING subsequence

Strinctly increasing - no duplicates
"""

def LIS_LCS_helper(s1, s1sorted):
    if len(s1) is 0:
        return 0
    if s1[0] == s2[0]:
        return 1 + LCS(s1[1:], s2[1:])
    return LCS(s1[1:], s2[1:])

def LIS(s1):
    return LCS(s1, sorted(s1))


#count = int(input())
#inp = [0] * count
#for i in range(count):
#    inp[i] = int(input())
#print LIS2(inp)

print LIS("abcdfyzaldhs")
print LIS([15, 27, 14, 38, 26, 55, 46, 65, 85])
print LIS([2, 7, 4, 3, 8])


arr = [1, 2, 6, 3, 14, 7, 10, 9, 0, 12]

def LIS2(arr):
    dp = [1] * len(arr)
    index = 1
    while (index < len(arr)):
    	subindex = index - 1
    	while (subindex >= 0):
    		if arr[index] > arr[subindex]:
    			dp[index] = max(dp[index], 1 + dp[subindex])
    		subindex -= 1
    	index += 1
    return dp[len(arr) - 1]
print LIS2("abcdfyzaldhs")
print LIS2([15, 27, 14, 38, 26, 55, 46, 65, 85])
print LIS2([2, 7, 4, 3, 8])
