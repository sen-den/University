




class LoadedTree: 
    def __init__(self, col=None): 
        self.children = dict()          
        if col:         
            for el in col:      
                self.add(el)

    def add(self, el): 
        if el[0] not in self.children:          
            self.children[el] = dict()          
        else:           
            n = 1
            key = el[0]
            child = self.children[key]
            
            while n < len(el) - 1:          
                
                key = el[n]         
                n += 1
                child = child[key]
           
            child[el[n+1]] = dict()    

   
    def get(self, el): 
        
        if el in self.children:         
            return self.children[el]
        
        else:                           
            child = self.children
            for char in el:
                if char in child:
                    
                    child = child[char]     
                else:
                    return None
            return child


def floor2(n): 
    num = 1
    while True:
        number = 2 ** num
        if number >= n:
            return num
        num += 1



def int2bin(x):                 
    n = "" if x > 0 else "0"
    while x > 0:
        y = str(x % 2)
        n = y + n
        x = int(x / 2)
    return n



def binl(x, l):            
    if len(x) >= l:
        return x
    while len(x) < l:
        x = '0' + x
    return x




def make_table(string, alphabet):   
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




def encode(string, table):              
    encoded = table[string[0:2]]
    for n in range(3, len(string), 2):
        encoded += ',' + table[string[n-1:n+1]]
    if (len(string) % 2) == 1:
        encoded += ',' + table[string[len(string)]]
    return encoded




def decode(string, table):              
    decoded = ''
    for code in string.split(','):
        decoded += dict_key_by_value(table, code)
    return decoded



def dict_key_by_value(dct, value):      
    for key in dct.keys():
        if dct[key] == value:
            return key
    return None


def main(string): 

    alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    table = make_table(string, alphabet)
    encoded = encode(string, table)
    decoded = decode(encoded, table)
    print('string:', string)
    print('table:', table)
    print('encoded:', encoded)
    print('decoded:', decoded)

main('ahfdkjnm')
