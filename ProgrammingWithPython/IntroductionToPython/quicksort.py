#Quick sort implementation algorithm
#Rodolfo Andrés Ramírez Valenzuela

def quicksort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[len(arr) // 2] # Make an integer division, making the pivot the number in the half
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    return quicksort(left) + middle + quicksort(right)

arr = [6,5,1,3,8,4,7,9,2]
print(quicksort(arr))
