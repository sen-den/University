def DigitCount(s, n = 0):
    if int(s) / 10 == 0:
        return n
    return (DigitCount(int(s) / 10, n + 1)

for i in range(5):
    print('Count = ', DigitCount(str(input('Number = '))), '\n')

