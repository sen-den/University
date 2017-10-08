import random
import sys
import time

sys.setrecursionlimit(10000)

def howlong(f):
    def tmp(*args, **kwargs):
        t = time.time()
        f(*args, **kwargs)
        need_time = time.time() - t
        return need_time
    return tmp


def randlist(size):
    return [random.randint(0, 1000)  for i in range(0, size)]


@howlong
def sort_bubble(data):
    for i in range(len(data)):
        for j in range(len(data) - 1):
            if data[j] > data[j+1]:
                data[j], data[j+1] = data[j+1], data[j]
    return data


@howlong
def sort_quick(data):
    return sort_quick_helper(data)


def sort_quick_helper(data):
    if data == []:
        return data
     
    less = []
    equal = []
    greather = []
    
    pivot = data[0]
    for i in data:
        if i > pivot:
            greather.append(i)
        elif i < pivot:
            less.append(i)
        else:
            equal.append(i)

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


listForSorting = randlist(int(sys.argv[1]))
 
print(sort_select(listForSorting))
print(sort_select2(listForSorting))
print(sort_quick(listForSorting))
print(sort_bubble(listForSorting))
