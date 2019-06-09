# Uses python3

import sys

# Task: Given 2 integers a, b find the GCD of a and b
# Solution: GCD(1344, 217) = GCD(217, 42) = GCD(42, 7) = GCD(7, 0) =7

def gcd(a, b):
    if b == 0:
       return a
    return gcd(b,  a%b)

if __name__ == "__main__":
    a = int(input())
    b = int(input())
    print(gcd(a, b))
