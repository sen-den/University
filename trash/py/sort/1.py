def f(n, i=1, j=0):
    if (n == 0):
        return True
    if (j == i - 1):
        print(i, ' ')
        return f(n-1, i+1, 0)
    print(i, ' ')
    return f(n-1, i, j+1)

f(10)

