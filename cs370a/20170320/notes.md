Week after spring break

---
Schedule
* 370 6:15-8:45
* Walk back 8:45-9:15
* Watch an episode of Shameless to clear head
* 10:30 start essay work
    * Pomodoro maybe? 25 mins work, 5 mins break, 30 mins for every 4th break
---

## Longest increasing subsequence (non-contiguous)

Last class we found it by sorting and removing duplicates, then find the longest common subsequence between that and the original. This works well but is too slow when it scales.

### The algorithm
Iterate over items, keep track of parents and the current store for the increasing sequence. For each new number, check if it is greater than the current end of the stored sequence. If it's larger, append the new number to the sequence, if it's not, binary search the stored array to find where the new number would go, and replace the number after it. For either one, take the previous number in the stored sequence and set it as the parent.

The example below uses the actual numbers to show the stored sequence and the parents, it would be better to use the indexes of the original, they'll all be unique.

EX: 3,9,1,7,8,4
0. Increasing sub = 0
1. 3
    * 3 > 0 = Append
    * Increasing sub = 0, 3
    * Parents:
        * 0 <-- 3
2. 3, 9
    * 9 > 3 = Append
    * Increasing sub = 0, 3, 9
    * Parents:
        * 0 <-- 3 <-- 9
3. 3, 9, 1
    * 1 !> 9 = Replace
    * Increasing sub = 0, 1, 9
    * Parents:
        * 0 <-- 3 <-- 9
        * 0 <-- 1
4. 3, 9, 1, 7
    * 7 !> 9 = Replace
    * Increasing sub = 0, 1, 7
    * Parents:
        * 0 <-- 3 <-- 9
        *
...

---

Homework: [Project Euler #59](https://projecteuler.net/problem=59)
