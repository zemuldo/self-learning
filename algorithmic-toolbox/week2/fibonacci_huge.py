# Uses python3
import sys

# Task: Given two integers 𝑛 and 𝑚, output 𝐹𝑛 mod 𝑚 (that is, the remainder of 𝐹𝑛 when divided by 𝑚)
# Solution: 𝐹𝑛 mod 𝑚 is a pattern that follows Pison period (starts with 0 1)
#           We detect the pison pattern, get its length , and find the last member of the last pison sequence
#           If pison is length x, it occurs in full n//x times and one incoplete one of length n%x
def get_fibonacci_huge(n, m):
    if n <= 1:
        return n

    previous = 0
    current  = 1

    for _ in range(n - 1):
        previous, current = current, previous + current

    return current % m
def pisano_detect(n, m):
    previous = 0
    current  = 1
    for i in range(m * m):
        previous, current = current, (previous + current) % m
        if previous == 0 and current == 1:
         return i + 1
    
if __name__ == '__main__':
    input = sys.stdin.read()
    n, m = map(int, input.split())
    new_n = n % pisano_detect(n, m)
    print(get_fibonacci_huge(new_n, m))
    
