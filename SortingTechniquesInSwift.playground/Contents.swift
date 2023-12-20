import UIKit

//Sortings Techniques in Swift iOS
//1:- Bubble Sort :->Bubble sort is a simple sorting algorithm that repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order.

func bubbleSort<T:Comparable>(_ array:inout [T]){
    
    guard array.count > 1 else { return }
    
     for i in 0..<array.count {
        for j in 0..<array.count - i - 1{
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
            }
        }
    }
}


//  2. Selection Sort:
//Selection sort is an in-place comparison sorting algorithm. It works by dividing the input list into a sorted and an unsorted region. It repeatedly selects the smallest (or largest) element from the unsorted region and swaps it with the first element of the unsorted region.


func selectionSort<T:Comparable>(_ array:inout [T]){
    
    guard array.count > 1 else { return }
    
    for i in 0..<array.count - 1 {
        var minIndex = i
        for j in i+1..<array.count {
            if array[j] < array[minIndex]{
                minIndex = j
                
            }
        }
        
        if i != minIndex{
            array.swapAt(i, minIndex)
        }
    }
}
