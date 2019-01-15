import Foundation

// This was my first atempt. Passed most test but not efficient
// enough. 
// Complete the arrayManipulation function below.
func arrayManipulation(n: Int, queries: [[Int]]) -> Int {
    // create array of zeros + 1. Not using slot 0
    var arr = Array(repeating: 0, count: n + 1) 
    var max = Int.min 
    
    for query in queries{
        for i in query[0]...query[1]{ // go from a to b 
            arr[i] += query[2]
            if arr[i] > max {
                max = arr[i]
            }
        }
    }

    return max 
}

// This function was written after reading the disscussion
// I think its a pretty cool solution but it was originally
// written in c++

// Complete the arrayManipulation function below.
func arrayManipulationTwo(n: Int, queries: [[Int]]) -> Int {
    var max = Int.min
    var arr = Array(repeating: 0, count: n+1)
    var x = 0
    
    for query in queries {
        arr[query[0]] += query[2]
        if query[1] + 1 <= n {
            arr[query[1]] -= query[2]
        }
    }

    for i in 1...n{
        x = x + arr[i]
        if max < x {
            max = x 
        }
    }
    
    return max
}
