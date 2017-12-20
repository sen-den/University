from random import randint 	# рандом
import math			# матан
import functools		# и какая-то хрень
# Что бы в функции можно было пихать функции, возвращать из них функции и заниматься прочьими функциональными извращениями



class BitVectorSet:             # Create class for BitVector Set # Таки правду написали, множество на бинарном векторе (хз что это такое, надо почитать)
    def __init__(self,size): # Конструктор
        self.array = [] # Пустой список, в котором будет все
        for n in range(size): # Наполняем его ложью в заданном количестве
            self.array[n] = False

    def __len__(self): # длина
        return len(self.array)

    def __contains__(self,el): # проверка наличия
        if len(self.array) < (el - 1): # магия...
            return False
        return self.array[el] == True

    def insert(self,el): # Вставить
        if el not in self:
            self.array[el] = True

    def remove(self,el): # Удалить
        if el in self:
            self.array[el] = False


# А тут даже сами написали комменты
# Правда, такие же по полезности
# Только нипаруски
class ListSet:                  # Create class List Set       
    
    def __init__(self):         # initialize empty list  
        self.l = []

    def __len__(self):          # return length of list   
        return len(self.l)

    def __str__(self):          # return list as string
        return str(self.l)

    def __repr__(self):         # represent as object
        return repr(self.l)

    def __contains__(self, el):     # check if element contains in a lis
        return el in self.l

    
    def __getitem__(self, key):     # get item by position
        return self.l[key]

    
    def __setitem__(self, key, value):      # set item and insert it on position
        if value in self.l:
            raise ValueError('Set already has value: ' + str(value))
        self.l[key] = value

    
    def add(self, value):                   # add value to the end of the list
        if value in self.l:
            raise ValueError('Set already has value: ' + str(value))
        self.l.append(value)

   
    def remove(self, value):                # remove element by value
        self.l.remove(value)


# Пересечение, то, что в обеих есть
def intersection(a, b):                     # define function for intersection
    
    if type(a) == type(b) and type(a) == BitVectorSet:  # if a and b is BitVectorSet objects
        result = BitVectorSet(max(len(a), len(b)))      # result is maximal value from a and b
        for n in range(len(result)):            # for every element in length of result Vector
            result[n] = a[n] and b[n]           # to result set initialize value from Vector a and Vector b   
        return result
    
    if type(a) == type(b) and type(a) == ListSet:   # if type of a and b is ListSet
        result = ListSet()          # initialize result to ListSet object
        for el in a.l:              # iterate through list a
            if el in b.l:       # iterate through list b
                result.add(el)  # to result add element
        return result
    else:
        raise TypeError('Incorrect arguments type') # return error


# Объединение, все, что хотя бы в одном из
def union(a, b):                    # define function for union
    
    if type(a) == type(b) and type(a) == BitVectorSet:      # if a and b is Vectors
        result = BitVectorSet(max(len(a), len(b)))
        for n in range(len(result)):
            result[n] = a[n] or b[n]
        return result
    if type(a) == type(b) and type(a) == ListSet:
        result = ListSet()
        for el in a.l:
            if el not in result:
                result.add(el)
        for el in b.l:
            if el not in result:
                result.add(el)
        return result
    else:
        raise TypeError('Incorrect arguments type')

# Разница, есть в первом, но нет во втором
def difference(a, b):
    
    if type(a) == type(b) and type(a) == BitVectorSet:      # if a and b Vectors
        result = BitVectorSet(max(len(a), len(b)))
        for n in range(len(result)):
            result[n] = True if (a[n] and not b[n]) or (not a[n] and b[n]) else False
        return result
    if type(a) == type(b) and type(a) == ListSet:
        result = ListSet()
        for el in a.l:
            if el not in b.l:
                result.add(el)
        for el in b.l:
            if el not in a.l:
                result.add(el)
        return result
    else:
        raise TypeError('Incorrect arguments type')

# Депутат
# Хз зачем он вообще нужен
# Такой задачи не нашел, о которой там говориться
# А тут какие-то странные штуки мы с ним делаем
class Congressman:
    def __init__(self, name='Ivan', price=None):
        if price == None:
            dice = randint(1, 100)          # if price is None than voters % choose random from 0 to 1000 # О да, 146% мало, повышаем
            if dice <= 20:              # if dice less than 20 price is inf # dice - игральная кость
                price = math.inf
            elif dice <= 30:                # else if dice less or equal to 30 price equals 0
                price = 0
            else:                       # price equals rand value from 1 to 1000
                price = randint(1,1000)
        self.name = name
        self.price = price
    
    def __str__(self):
        return repr(self)
    
    def __repr__(self):
        return '{0}: {1}'.format(self.name, self.price)
    
    def give(self, payment): # дать депутату бабла?
        return self.price <= payment



def generate_congressmans(count):                   # function that create congressmans
    return [Congressman() for n in range(count)] # генератор рандомных депутатов


 # Счас бы без задачи решение разбирать
  # Походу считаем своих и не своих
   # ОНО ДАЖЕ ЗАПУСКАЕТСЯ И СЧИТАЕТ!!!!111
def vote(price, data, print_data=False):            # function that represent votes
    money_amount = data['money_amount']
    congressmans = data['congressmans']
    friends = data['friends']
    neutrals = data['neutrals']
    enemies = data['enemies']

    
    if money_amount < price * len(list(filter((lambda x: 0 < x.price < math.inf), congressmans))):      # if money_amount less than price multiply
        raise ValueError('Not enough money')
    votes = 0
    for c in congressmans:
        if c.price == 0:
            votes += 1
            if c not in friends:
                friends.add(c)
        else:
            voted = False
            if c not in enemies:
                voted = c.give(price)
                money_amount -= price
            if voted:
                votes += 1
            if c.price == math.inf:
                if c not in enemies:
                    enemies.add(c)
            else:
                if c not in neutrals:
                    neutrals.add(c)
    votes_percents = votes / len(congressmans) * 100
    if print_data:
        print('friends:', len(friends))
        print('neutrals:', len(neutrals))
        print('enemies:', len(enemies))
        print('votes:', votes)
        print('percent:', votes_percents)
    return votes_percents


def main(money_amount, price, print_data=True):
    data = {
        'money_amount': money_amount,
        'congressmans': generate_congressmans(450),
        'friends': ListSet(),
        'neutrals': ListSet(), 'enemies': ListSet()
    }
    vote(price, data, print_data)


main(10000000, 300)
