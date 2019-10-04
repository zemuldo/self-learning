def search(raw, n, element):
    for i in range(0, n):
        if raw[i] == element:
            return i+1
    return -1

# arr = [10, 20, 80, 30, 60, 50, 110, 100, 130, 170]
# n = len(raw)
num_inputs = input()

for i in range(0, int(num_inputs)):
    n_and_k = [int(x) for x in input().split()]
    n = n_and_k[0]
    k = n_and_k[1]
    arr = [int(x) for x in input().split()]
    result = search(arr, n, k)
    print(result)
