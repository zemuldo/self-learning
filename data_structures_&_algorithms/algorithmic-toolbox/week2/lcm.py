# Uses python3
import sys

# Task: Given two integers 𝑎 and 𝑏, find their least common multiple.
# Solution: LCM = product of a and b devided by their GCD

def gcd(a, b):
    if b == 0:
       return a
    return gcd(b,  a%b)

def lcm(a, b):
    return int(a*b // gcd(a, b))

if __name__ == '__main__':
    input = sys.stdin.read()
    a, b = map(int, input.split())
    print(lcm(a, b))