import Foundation

// Solution works but is not effienct therefore timeout

// Complete the minimumSwaps function below.
func minimumSwaps(arr: inout [Int]) -> Int {
    return minimumSwaps(arr: &arr, start: 0)
}

func minimumSwaps(arr: inout [Int], start: Int) -> Int{
    if start < arr.count - 1 {
        let index = findMinimumIndex(arr: arr, start: start)
        if start != index {
            arr[index] = arr[start]
            return 1 + minimumSwaps(arr: &arr,  start: start + 1)
        } 
        // else 
        return minimumSwaps(arr: &arr,  start: start + 1)
    }
    return 0
}

func findMinimumIndex( arr: [Int], start: Int) -> Int{
    var minPos = start
    
    for i in start+1..<arr.count{
         if arr[i] < arr[minPos] {
                minPos = i
        }
    }
    
    return minPos
}


// More efficient solution found after doing some research
func minimumSwapsEff(arr:  inout [Int]) -> Int {
    var c = 0, n = arr.count
    var i : Int = 0 
   
    while i < n{
        if (arr[i] != i+1){ 
           arr.swapAt(i, arr[i] - 1)
           c += 1
            i -= 1  
        }
        i += 1 
    }
    
    return c
}

var arr = [1, 3, 5, 2, 4, 6, 7]

print(minimumSwapsEff(arr: &arr))
print(arr)
