def binary_search(arr, n, k):
    start_index = 0
    end_index = n-1

    # while start index is less or equal to end index
    while start_index <= end_index:

        # mid index is the start index + end index - start index
        # if start index is 40 and end index is 45 then mid index is 40 + 1.5 ie 43/42 ~ whatever 😂
        mid_index = start_index + (end_index - start_index)//2

        # k is the current mid index
        if arr[mid_index] == k:
            return 1
        # k is on the right
        elif arr[mid_index] < k:
            start_index = mid_index + 1
        # k is on the left, 
        else:
            end_index = mid_index - 1
    return -1

num_inputs = int(input())

for i in range(0, num_inputs):
    n_and_k = [int(x) for x in input().split()]
    n = n_and_k[0]
    k = n_and_k[1]
    arr = [int(x) for x in input().split()]
    result = binary_search(arr, n, k)
    print(result)