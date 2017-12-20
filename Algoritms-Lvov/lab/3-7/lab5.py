# Реалізація алгоритму Лемпела-Зіва архівації 
# Даже звучит страшно
# Можно пугать непросвященных
# Как интегральной теоремой лаплпса

class LoadedTree: # Груженое дерево
    def __init__(self, col=None): # И его конструктор
        self.children = dict()          # init children variable to empty dict
        if col:         # if col is not null
            for el in col:      # then iterate through column and add elements
                self.add(el)

    def add(self, el): # добавить элемент в дерево, в определенное его место
        if el[0] not in self.children:          # if element is not in children instance
            self.children[el] = dict()          # init it with empty dict
        else:           # else take child from children instance
            n = 1
            key = el[0]
            child = self.children[key]
            
            while n < len(el) - 1:          # while n less than length of el - 1
                
                key = el[n]         # get child from dict
                n += 1
                child = child[key]
           
            child[el[n+1]] = dict()    # init empty dict in child

   
    def get(self, el): # взять из дерева
        
        if el in self.children:         # if el in children return and do nothing
            return self.children[el]
        
        else:                           # else init child with children instance
            child = self.children
            for char in el:
                if char in child:
                    
                    child = child[char]     # get it from child
                else:
                    return None
            return child


def floor2(n): # судя по факту -- ищит наименьшее число, 2 в степени которого больше данного числа
    num = 1
    while True:
        number = 2 ** num
        if number >= n:
            return num
        num += 1


# обычное 10 число в 0 и 1
def int2bin(x):                 # convert integer to binary
    n = "" if x > 0 else "0"
    while x > 0:
        y = str(x % 2)
        n = y + n
        x = int(x / 2)
    return n


# походу, добавляет ведущие нули до нужной длины
def binl(x, l):            # return x
    if len(x) >= l:
        return x
    while len(x) < l:
        x = '0' + x
    return x


# ДЕЛАЕТ ТАБЛИЦУ
# магия
def make_table(string, alphabet):   # make hash table
    table = dict()
    for char in alphabet:
        if char in string:
            table[char] = None
        for ch in alphabet:
            if (char + ch) in string:
                table[char + ch] = None
    chars_count_floor = floor2(len(table))
    n = 0
    for key in table.keys():
        table[key] = binl(int2bin(n), chars_count_floor)
        n += 1
    return table


# кодирует
# магия
def encode(string, table):              # encode string
    encoded = table[string[0:2]]
    for n in range(3, len(string), 2):
        encoded += ',' + table[string[n-1:n+1]]
    if (len(string) % 2) == 1:
        encoded += ',' + table[string[len(string)]]
    return encoded


# декодирует
# немного магии
def decode(string, table):              # decode string
    decoded = ''
    for code in string.split(','):
        decoded += dict_key_by_value(table, code)
    return decoded


# а вот еще кусок от предыдущегго. в словаре находит КЛЮЧ по его значению
def dict_key_by_value(dct, value):      # search key by value
    for key in dct.keys():
        if dct[key] == value:
            return key
    return None


def main(string): # берем строку из самого конца, в нашем алфавите её кодируем-дкодируем и всячески надругаемся
# паралельно выводя на экран
    alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    table = make_table(string, alphabet)
    encoded = encode(string, table)
    decoded = decode(encoded, table)
    print('string:', string)
    print('table:', table)
    print('encoded:', encoded)
    print('decoded:', decoded)

main('ahfdkjnm')
