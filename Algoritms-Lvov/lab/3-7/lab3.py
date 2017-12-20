import math

class MyTree: 
    def __init__(self, pair = None, *children): 
        self.pair = pair
        self.children = [] 
        if children != None:
            for child in children:
                self.children.append(MyTree(child)) 

    def __contains__(self,value): 
        if self.pair == None: 
            return False 
        if self.pair[1] == value:
            return True 
        if len(self.children) == 0:
            return False 
        for child in self.children:
            if value in child:
                return True 
        return False 

    def __len__(self): 
        return len(self.prefix_traverse()) 

    def __str__(self): 
        return repr(self) 

    def __repr__(self,indent = 0): 
        s = repr(self.pair) + '\n'
        for child in self.children:
            s += child.__repr__(indent + 4) + '\n' 
        return ((' ' * indent) + s)

    def __getitem__(self,key): 
        return self.children[key].pair

    def __setitem__(self,key,value): 
        self.children[key].pair = value

    def find(self,key): 
        if self.pair[0] == key: 
            return self.pair[1]
        else:
            for child in self.children: 
                val = child.find(key)
                if val != None:
                    return val
            return None

    def add(self,pair): 
        if pair[1] in self:
            return 
        if self.pair == None: 
            self.pair = pair
        self.children.append(MyTree(pair)) 

	
	
    def infix_traverse(self): 
        kvp = []
        for n in range(math.ceil(len(self.children)/2)):
            kvp.append(self.children[n].infix_traverse())
        if self.pair != None:
            kvp.append(self.pair)
        for n in range(math.ceil(len(self.children)/2), len(self.children)):
            kvp.append(self.children[n].infix_traverse())
        return kvp

    def prefix_traverse(self): 
        kvp = []
        if self.pair != None:
            kvp.append(self.pair)
        for child in self.children:
            kvp.append(child.prefix_traverse())
        return kvp

    def postfix_traverse(self):  
        kvp = []
        for child in self.children:
            kvp.append(child.postfix_traverse())
        if self.pair != None:
            kvp.append(self.pair)
        return kvp

class BTree: 
    def __init__(self, pair = None, left = None, right = None): 
        self.pair = pair
        self.left = left 
        self.right = right 

    def __contains__(self,value): 
        if self.pair == None:
            return False
        if self.pair[1] == value:
            return True
        elif (self.left != None) and (value in self.left):
            return True
        elif (self.right != None) and (value in self.right):
            return True
        return False

    def __len__(self):
        return len(self.prefix_traverse())

    def __str__(self):
        return repr(self)

    def __repr__(self,indent = 0):
        s = repr(self.pair)
        ls = (' ' * (indent + len(s))) + 'None\n' if self.left == None else self.left.__repr__(indent + len(s))
        rs = (' ' * (indent + len(s))) + 'None\n' if self.right == None else self.right.__repr__(indent + len(s))
        return ((' ' * indent) + s + '\n' + ls + rs)

    def find(self,key): 
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

    def find_pair(self,key): 
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

    def add(self,pair): 
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

    def infix_traverse(self): 
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

def frequency_table(string): 
	d = {}
	for char in string:
		if char not in d:
			d[char] = 1
		else:
			d[char] += 1
	return d

def chars_by_frequency(table): 
	kvpl = [(table[k],k) for k in table.keys()]
	kvpl.sort(key=lambda x: x[0], reverse=True)
	return kvpl

def huffman_tree(table): 
    tree = BTree(pair = (0,'42'))
    for pair in chars_by_frequency(table):
        tree.add(pair)
    return tree

def char_code(char,tree): 
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

def huffman_encode(string): 
    d=frequency_table(string)
    t=huffman_tree(d)
    char_codes = {char:char_code(char,t) for char in set(string)}
    encoded = [char_code(char,t) for char in string]
    encoded = ','.join(encoded)
    return {'table': d, 'tree': t, 'char codes': char_codes, 'encoded': encoded} 

def huffman_decode(encoded,table): 
    decoded = [key_by_value(fragment,table) for fragment in encoded.split(',')]
    return ''.join(decoded)

def key_by_value(value,dct): 
    for key in dct.keys():
        if dct[key] == value:
            return key
    return None

b = BTree (left=4, right=5)
b.add('text')
