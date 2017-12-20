import math


def point_lists_equals(a, b):           
    if len(a) != len(b): return False
    for n in range(len(a)):
        if a[n] not in b:
            return False
    return True



def neighboors(graph, point):       
    matrix = graph
    pos = matrix[0].index(point)
    tflist = matrix[1][pos]
    neighboors = []
    for n in range(len(tflist)):
        if tflist[n]:
            neighboors.append(matrix[0][n])
    return neighboors



def joined_neighboors(graph, point, travelled=None):    
    if not travelled:
        travelled = []
    result = []
    if point not in travelled:
        travelled.append(point)
    for neighboor in neighboors(graph, point):
        if neighboor not in travelled:
            travelled.append(neighboor)
            result.append(neighboor)
            result.extend(joined_neighboors(graph, neighboor, travelled))
    return result



def nearest_from_island(graph, first_point):        
    min_dist = math.inf
    nearest = None
    for point in joined_neighboors(graph, first_point):
        if min_dist > dist(point, nearest_point(graph, point)):
            nearest = point
    return nearest



def nearest_unjoined_point(matrix, point_to):       
    min_dist = math.inf
    nearest = None
    for point in matrix[0]:
        print('nearest_unjoined_point:', point)
        print('joined_neighboors:', joined_neighboors(matrix, point_to))
        if (point != point_to) and (dist(point, point_to) < min_dist)\
                and (point not in joined_neighboors(matrix, point_to)):
            nearest = point
    return nearest



def dist(point1, point2):                 
    return math.sqrt((point2[0] - point1[0]) ** 2) + ((point2[1] - point1[1]) ** 2)



def singletons(matrix):                 
    result = []
    for n in len(matrix[0]):
        if matrix[1][n].count(True) <= 1:
            result.append(matrix[0][n])
    return result



def nearest_point(matrix, point_to):    
    min_dist = math.inf
    nearest = None
    for point in matrix[0]:
        if point != point_to and dist(point, point_to) < min_dist:
            nearest = point
            min_dist = dist(point, point_to)
    return nearest



def join(matrix, point1, point2):
    pos1 = matrix[0].index(point1)
    pos2 = matrix[0].index(point2)
    if (pos1 == -1) or (pos2 == -1):
        raise ValueError('point(s) not in graph')
    matrix[1][pos1][pos2] = True
    matrix[1][pos2][pos1] = True





def main():                                         
    graph = ([[1, 2], [3, 4], [-2, -5], [4, -10]], 
             [[True, False, False, False],
              [False, True, False, False],
              [False, False, True, False],
              [False, False, False, True]])
    for point in graph[0]:
        join(graph, point, nearest_point(graph, point))
    print('graph:', graph)



main()                  
