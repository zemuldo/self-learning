# Uses python3
import sys

# Task:  Compute the last digit of 𝐹02 +𝐹12 +···+𝐹𝑛2.
# Solution:  Find Pison that Fn mod 10 follows, find what version of it fits in 0 to n and how many. 
#            Tranform to last digit of squares,  Then sum and get last digit


def pisano_detect(n, m):
    previous = 0
    current  = 1
    pisano_sequence = list(range(200))
    pisano_sequence[0] = 0
    pisano_sequence[1] = 1
    for i in range(m * m):
        previous, current = current, (previous + current) % m
        pisano_sequence[i+2] = current
        if previous == 0 and current == 1:
         return pisano_sequence[0: i+1]

def get_sum_last_digit(n):
    my_pisano = pisano_detect(n, 10)
    my_sq_pisons = [] + my_pisano
    
    for i in range(len(my_pisano)):
        my_sq_pisons[i] = (my_pisano[i] * my_pisano[i])%10

    return (sum(my_sq_pisons)* (n//60)  + sum(my_sq_pisons[0: (n+1)%60])) % 10
    

if __name__ == '__main__':
    input = sys.stdin.read()
    n = int(input)
    # n = int(input())
    print(get_sum_last_digit(n))
    
