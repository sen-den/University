def Combin1(N, K):
    Combin1.count += 1
    if ((K == 0) or (K == N)):
        return 1
    c1 = Combin1(N-1, K) 
    c2 = Combin1(N-1, K-1)
    return c1+c2


for i in range(5):
    Combin1.count = 0
    N = int(input('N = '))
    K = int(input('K = '))
    C = Combin1(N, K)
    n = Combin1.count
    print(Combin1(N, K))
    print('C({}, {}) = {:5d} ({} calls)\n'.format(N, K, C, n))

