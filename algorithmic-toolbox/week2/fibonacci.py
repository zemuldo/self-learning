# Uses python3

# Task: Given an integer 𝑛, find the 𝑛th Fibonacci number 𝐹𝑛.
# Solution: Iterate from 0-n summing previous immediate 2 to make up next list member
def calc_fib(n):
    if n==0:
        return 0
    if n==1: 
        return 1
    nums = list(range(0,n+1))
    for i in nums[2:]:
       nums[i] = nums[i-1] + nums[i-2]
    return nums[n]

n = int(input())
print(calc_fib(n))
