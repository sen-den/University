import math

class MyTree: # Класс дерево, объявляем его
    def __init__(self, pair = None, *children): # КОнструктор, получает может быть нечто pair и еще какие-нибудь переменные (список)
        self.pair = pair
        self.children = [] # создаем у себя пустой
        if children != None:
            for child in children:
                self.children.append(MyTree(child)) # И пихаем туда все, что есть

    def __contains__(self,value): # Для конструкции типа if A in B. Будет if <value> in <self> (по идее)
        if self.pair == None: 
            return False # Если в корне пусто, то все, ничего нет точно
        if self.pair[1] == value:
            return True # А если то что ищем, то отлично
        if len(self.children) == 0:
            return False # Но если не это и детей нет, то нет
        for child in self.children:
            if value in child:
                return True # А если в ком-то, то нашли
        return False # А если не нашли, то нет

    def __len__(self): # Длина
        return len(self.prefix_traverse()) # Где-то потом будет пояснение втф это

    def __str__(self): # Если захочем вывести напрямую, то преобразовывает в строку (или просто преобразовывает str(наше дерево)
        return repr(self) # Где-то потом будет пояснение втф это

    def __repr__(self,indent = 0): # Когда попвтаемся вывести на экран, то преобразует в нужный вид
        s = repr(self.pair) + '\n'
        for child in self.children:
            s += child.__repr__(indent + 4) + '\n' # Выравниваем походу отступами
        return ((' ' * indent) + s)

    def __getitem__(self,key): # self[key] дает нам сделать, как со списками
        return self.children[key].pair

    def __setitem__(self,key,value): # Аналогично, только добавить (хз как это применить)
        self.children[key].pair = value

    def find(self,key): # Ищет, судя по названию
        if self.pair[0] == key: # если прям в корне, то отлично
            return self.pair[1]
        else:
            for child in self.children: # иначе берем всех детей и перебираем, рекурсивненько будет
                val = child.find(key)
                if val != None:
                    return val
            return None

    def add(self,pair): # Что-то куда-то добавить
        if pair[1] in self:
            return # если уже есть, то забиваем
        if self.pair == None: #  если вообще пусто, то прям в корень пихаем
            self.pair = pair
        self.children.append(MyTree(pair)) # иначе в детей

	# вот это вот дальше идет
	# зліва направо, зверху вниз, знизу вверх.
    def infix_traverse(self): 
        kvp = []
        for n in range(math.ceil(len(self.children)/2)):
            kvp.append(self.children[n].infix_traverse())
        if self.pair != None:
            kvp.append(self.pair)
        for n in range(math.ceil(len(self.children)/2), len(self.children)):
            kvp.append(self.children[n].infix_traverse())
        return kvp

    def prefix_traverse(self): # поиск снизу вверх (вроде)
        kvp = []
        if self.pair != None:
            kvp.append(self.pair)
        for child in self.children:
            kvp.append(child.prefix_traverse())
        return kvp

    def postfix_traverse(self):  # и сверху вниз (наверное)
        kvp = []
        for child in self.children:
            kvp.append(child.postfix_traverse())
        if self.pair != None:
            kvp.append(self.pair)
        return kvp

class BTree: # БИНАРНОЕ ДЕРЕВО
    def __init__(self, pair = None, left = None, right = None): # Принцип тот же, дерево это корень и до (теперь важно) двух поддеревьев
        self.pair = pair
        self.left = left # левое 
        self.right = right # и правое

    def __contains__(self,value): # Аналогично поиск /содержит ли
        if self.pair == None:
            return False
        if self.pair[1] == value:
            return True
        elif (self.left != None) and (value in self.left):
            return True
        elif (self.right != None) and (value in self.right):
            return True
        return False
# Длина, в строку, в представление
    def __len__(self):
        return len(self.prefix_traverse())

    def __str__(self):
        return repr(self)

    def __repr__(self,indent = 0):
        s = repr(self.pair)
        ls = (' ' * (indent + len(s))) + 'None\n' if self.left == None else self.left.__repr__(indent + len(s))
        rs = (' ' * (indent + len(s))) + 'None\n' if self.right == None else self.right.__repr__(indent + len(s))
        return ((' ' * indent) + s + '\n' + ls + rs)

    def find(self,key): # Поиск
        if self.pair[0] == key:
            return self.pair[1]
        else:
            lval = self.left.find(key)
            if lval != None:
                return lval
            rval = self.right.find(key)
            if rval != None:
                return rval
            return None

    def find_pair(self,key): # ищем узел
        if self.pair[0] == key:
            return self.pair
        else:
            lval = self.left.find_pair(key) if type(self.left) == BTree else None
            if lval != None:
                return lval
            rval = self.right.find_pair(key) if type(self.right) == BTree else None
            if rval != None:
                return rval
            return None

    def add(self,pair): # пихаем узел
        if pair[1] in self:
            return
        if self.pair == None:
            self.pair = pair
        elif pair[1] <= self.pair[1]:
            if self.left == None:
                self.left = BTree(pair)
            else:
                self.left.add(pair)
        else:
            if self.right == None:
                self.right = BTree(pair)
            else:
                self.right.add(pair)

    def infix_traverse(self): # Обходы сраные, нужно вникунуть в это по человечески
        kvp = []
        if type(self.left) == BTree:
            kvp.extend(self.left.infix_traverse())
        if self.pair != None:
            kvp.append(self.pair)
        if type(self.right) == BTree:
            kvp.extend(self.right.infix_traverse())
        return kvp

    def prefix_traverse(self):
        kvp = []
        if self.pair != None:
            kvp.append(self.pair)
        if type(self.left) == BTree:
            kvp.extend(self.left.prefix_traverse())
        if type(self.right) == BTree:
            kvp.extend(self.right.prefix_traverse())
        return kvp

    def postfix_traverse(self):
        kvp = []
        if type(self.left) == BTree:
            kvp.extend(self.left.postfix_traverse())
        if type(self.right) == BTree:
            kvp.extend(self.right.postfix_traverse())
        if self.pair != None:
            kvp.append(self.pair)
        return kvp

def frequency_table(string): # таблица частот. Походу для хафмана
	d = {}
	for char in string:
		if char not in d:
			d[char] = 1
		else:
			d[char] += 1
	return d

def chars_by_frequency(table): # символы по частоте сортируем
	kvpl = [(table[k],k) for k in table.keys()]
	kvpl.sort(key=lambda x: x[0], reverse=True)
	return kvpl

def huffman_tree(table): # строим дерево хафмана, для кодирования
    tree = BTree(pair = (0,'42'))
    for pair in chars_by_frequency(table):
        tree.add(pair)
    return tree

def char_code(char,tree): # дает код по нему и таблице с ним
	if char not in tree:
		return None
	code = ''
	current_tree = tree
	while char != current_tree.pair[1]:
		if (current_tree.left and char in current_tree.left):
			current_tree = current_tree.left
			code += '0'
		else:
			current_tree = current_tree.right
			code += '1'
	return code

def huffman_encode(string): # кодирует, возвращает множество
    d=frequency_table(string)
    t=huffman_tree(d)
    char_codes = {char:char_code(char,t) for char in set(string)}
    encoded = [char_code(char,t) for char in string]
    encoded = ','.join(encoded)
    return {'table': d, 'tree': t, 'char codes': char_codes, 'encoded': encoded} # из всего добра что может пригодится

def huffman_decode(encoded,table): # раскодирует по закодированному и его таблице
    decoded = [key_by_value(fragment,table) for fragment in encoded.split(',')]
    return ''.join(decoded)

def key_by_value(value,dct): # Находит в словаре первый кулюч данного значения
    for key in dct.keys():
        if dct[key] == value:
            return key
    return None

b = BTree (left=4, right=5)
b.add('text')
