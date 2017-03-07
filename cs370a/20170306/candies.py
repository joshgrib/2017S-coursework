#https://www.hackerrank.com/challenges/candies
"""
students = [1, 2, 2, 3, 1, 2, 3, 4, 3, 1]
candies  = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
solution = [1, 2, 1, 2, 1, 2, 3, 4, 2, 1]

for i in range(len(students)-1):
    index = i+1
    print index
    prev_s = students[i-1]
    curr_s = students[i]
    prev_c = candies[i-1]
    curr_c = candies[i]
    if prev_s < curr_s and prev_c >= curr_c:
        candies[index] = prev_c + 1
for i in range(len(students)-1):
    index = len(students) - (i+1)
    print index
    prev_s = students[i+1]
    curr_s = students[i]
    prev_c = candies[i+1]
    curr_c = candies[i]
    if prev_s < curr_s and prev_c >= curr_c:
        candies[index] = prev_c + 1

print candies
"""
# read the count
num_s = int(input())
# create arrays
ratings = [0] * num_s
candies = [1] * num_s

# read in values
for i in range(num_s):
    ratings[i] = int(input())
# update going forward
for i in range(1, num_s):
    if ratings[i] > ratings[i-1] and candies[i] <= candies[i-1]:
        candies[i] = candies[i-1]+1
# update going backwards
for i in range(num_s-1, 0, -1):
    if ratings[i] > ratings[i-1] and candies[i] <= candies[i-1]:
        candies[i-1] = candies[i]+1
#print values
print candies
print sum(candies)
