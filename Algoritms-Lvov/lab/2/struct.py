import sys


class Queue:
    def __init__(self):
        self.items = []

    def isEmpty(self):
        return self.items == []

    def enqueue(self, item):
        self.items.insert(0,item) # add into first position
        return item

    def dequeue(self):
        if not self.size() == 0: 
            return self.items.pop()
        else:
            return None

    def delMin(self):
        return self.items.remove(min(self.items))

    def size(self):
        return len(self.items)


class Stack:
    def __init__(self):
        self.items = []

    def isEmpty(self):
        return self.items == []

    def push(self, item):
        self.items.append(item)

    def pop(self):
        if not self.size() == 0: 
            return self.items.pop()
        else:
            return None

    def peek(self):
        if not self.size() == 0:
            return self.items[len(self.items)-1]
        else:
            return None

    def size(self):
        return len(self.items)
     

class List:
    def __init__(self):
        self.leftItems = Stack() 
        self.rightItems = Stack()

    def isEmpty(self):
        return self.rightItems.isEmpty() and self.leftItems.isEmpty()

    def pushHere(self, item):
        self.leftItems.push(item)

    def popHere(self): # insert here
        if not self.rightItems.isEmpty():
            return self.rightItems.pop()
        elif not self.leftItems.isEmpty():
            return self.leftItems.pop()
        else:
            return None

    def peekHere(self): #returns last
        return self.leftItems.peek()

    def goLeft(self):
        if not self.leftItems.isEmpty():
            self.rightItems.push(self.leftItems.pop())
            return True
        return False

    def goRight(self):
        if not self.rightItems.isEmpty():
            self.leftItems.push(self.rightItems.pop())
            return True
        return False

    def size(self):
        return self.leftItems.size() + self.rightItems.size()
        return len(self.items)
    

if (len(sys.argv) == 1):
    print('Use command line arguments - one or more elements to be processed')
else:
    Q1 = Queue()
    print('Queue created')
    S1 = Stack()
    print('Stack created')
    L1 = List()
    print('List created')

    for param in sys.argv[1:]:
        Q1.enqueue(param) 
        S1.push(param)
        L1.pushHere(param)
       
    Q1.delMin()
    print('Minimal element removed')
    print('Dequeueyed items:')
    while not Q1.isEmpty():
        print(Q1.dequeue())
       
    print('Destacked items:')
    while not S1.isEmpty():
        print(S1.pop())

    print('Go to list begining and delist intems')
    while L1.goLeft():
        pass
    while not L1.isEmpty():
        print(L1.popHere())
