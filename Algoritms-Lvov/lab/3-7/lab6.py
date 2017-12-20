import math 












def neighboors(graph, graphtype, point):
    if graphtype == 'matrix':
        matrix = graph
        pos = matrix[0].index(point)
        tflist = matrix[1][pos]
        neighboors = []
        for n in range(len(tflist)):
            if tflist[n]:
                neighboors.append(matrix[0][n])
        return neighboors
        
    elif graphtype == 'list':
        lst = graph
        pos = -1
        for n in range(len(lst)):
            if lst[0][n] == point:
                pos = n
                break
        if pos == -1: raise ValueError('point not in graph')
        return lst[pos+1][:]
        
    else:
        raise TypeError('Incorrect type of graph')




def deep_traverse(graph, graphtype, point = None, offset = 0, travelled = None):
    if travelled == None:
        travelled = []
    if graphtype == 'matrix':
        if point == None:
            deep_traverse(graph, graphtype, graph[0][0], offset)
        else:
            print(' '* offset, 'point: ', point, sep='')
            for neighboor in neighboors(graph, graphtype, point):
                if neighboor not in travelled:
                    deep_traverse(graph, graphtype, neighboor, offset + 4)
        
    elif graphtype == 'list':
        if point == None:
            deep_traverse(graph, graphtype, graph[0][0], offset)
        else:
            print(' '* offset, 'point: ', point, sep='')
            for neighboor in neighboors(graph, graphtype, point):
                if neighboor not in travelled:
                    deep_traverse(graph, graphtype, neighboor, offset + 4)
    else:
        raise TypeError('Incorrect type of graph')




def dist(graph, graphtype, point1, point2):
    return math.sqrt((point2[0] - point1[0]) ** 2) + ((point2[1] - point1[1]) ** 2)


def main():
    graph = [[[3,3],[2,2],[2,4],[1,1]]]
    graph.append([graph[0][1], graph[0][2]])
    graph.append([graph[0][3]])
    graph.append([])
    graph.append([])

    print('graph:', graph)
    print()
    
    deep_traverse(graph, 'list')


main()
