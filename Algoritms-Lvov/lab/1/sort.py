import random
import sys
import time

sys.setrecursionlimit(10000)

# function-decorator for other functions. Returns decorated function execution time
def howlong(f):
    def tmp(*args, **kwargs):
        t = time.time()
        f(*args, **kwargs)
        need_time = time.time() - t
        return need_time
    return tmp


# Bubblesort decorated function
@howlong
def sort_bubble(data):
    for i in range(len(data)):
        for j in range(len(data) - 1):
            if data[j] > data[j+1]:
                data[j], data[j+1] = data[j+1], data[j]
    return data


# Recursion function decoration is untrivial, couses errors when decoratet directly.
# Used 'helper' function for avoiding this.
@howlong
def sort_quick(data):
    return sort_quick_helper(data)


def sort_quick_helper(data):
    if data == []:
        return data
     
    less = []
    equal = []
    greather = []
    # splitting into three subarrays
    pivot = data[0]
    for i in data:
        if i > pivot:
            greather.append(i)
        elif i < pivot:
            less.append(i)
        else:
            equal.append(i)
    # and concatenting sorted subarrays recursively

    return sort_quick_helper(less) + equal + sort_quick_helper(greather)


@howlong
def sort_select(arr):
    i = len(arr)
    while i > 1:
        max = 0
        for j in range(i):
            if arr[j] > arr[max]:
                max = j
        arr[i-1], arr[max] = arr[max], arr[i-1]
        i -= 1
    return arr


@howlong
def sort_select2(arr):
    for i in range(len(arr), 1, -1):
        max = 0
        for j in range(i):
            if arr[j] > arr[max]:
                max = j
        arr[i-1], arr[max] = arr[max], arr[i-1]
    return arr


def randlist(size):
    return [random.randint(0, 1000)  for i in range(0, size)]

if (len(sys.argv) == 1):
    print('Use command line arguments - one or more integer array sizes for test')
else:
    for param in sys.argv[1:]:
        listForSorting = randlist(int(param))
     
        print()
        print('Select sort, ', param, ': ', sort_select(listForSorting))
        print('Quick sort, ', param, ': ', sort_quick(listForSorting))
        print('Bubble sort, ', param, ': ', sort_bubble(listForSorting))
