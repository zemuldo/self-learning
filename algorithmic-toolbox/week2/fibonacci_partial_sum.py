# Uses python3
import sys

# Task: Given two non-negative integers 𝑚 and 𝑛, where 𝑚 ≤ 𝑛, find the last digit of the sum 𝐹𝑚 + 𝐹𝑚+1 + ···+𝐹𝑛.
# Solution:  Find Pison that Fn mod 10 follows, find what version of it fits in m to n and how many. Then sum and get last digit

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

def get_sum_last_digit_partial(m, n):
    my_pisano = pisano_detect(n, 10)
    first_part_of_partial_pison = my_pisano[m%60:60]
    lst_part_of_partial_pison = my_pisano[0:m%60]
    actual_partial_pison = first_part_of_partial_pison + lst_part_of_partial_pison
    new_n = n-m
    sum_fulls = sum(actual_partial_pison) * (new_n//60)
    sum_last_incomplt = sum(actual_partial_pison[0: (new_n+1)%60])
    return (sum_fulls+sum_last_incomplt) % 10
    

if __name__ == '__main__':
    input = sys.stdin.read()
    from_, to = map(int, input.split())
    # from_ = int(input())
    # to = int(input())
    print(get_sum_last_digit_partial(from_, to))
    