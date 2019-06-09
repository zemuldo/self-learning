# Uses python3

# Task: Given an integer 𝑛, find the last digit of the 𝑛th Fibonacci number 𝐹𝑛 (that is, 𝐹𝑛 mod 10).
# Solution: Iterate from 0-n summing previous immediate 2 to make up next list member and return 
#           the last digit of the last number in sequence

def get_fibonacci_last_digit(n):
    if n==0:
        return 0
    if n==1: 
        return 1
    previous = 0
    current = 1
    for _ in range(n - 1):
       previous, current = current % 10, (previous + current) % 10
    return current % 10

n = int(input())
print(get_fibonacci_last_digit(n))
