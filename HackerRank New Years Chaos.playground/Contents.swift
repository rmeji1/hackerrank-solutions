//: Playground - noun: a place where people can play

import UIKit

func minimumBribesRecursion(_ q: [Int],_ bribes: Int,_ start: Int){
//  print(q)
  if q.count == 1 {
    print(bribes)
    return
  }
  
  var localBribes = 0
  // Don't need start
  if q.count > 4 {
    for k in 1..<4{
      if q[0] > q[k]{
        localBribes += 1
      }
    }
  }else{
    for k in 1..<q.count{
      if q[0] > q[k]{
        localBribes += 1
      }
    }
  }
  
  
//  print(localBribes)
  if localBribes > 2{
    print("Too chaotic")
  }else{
    localBribes += bribes
//    let localStart = start + 1
    minimumBribesRecursion(Array(q[1...]), localBribes, 0)
  }
}

// Complete the minimumBribes function below.
func minimumBribes(q: [Int]) -> Void {
  minimumBribesRecursion(q, 0, 0)
}


var q = [2, 1, 5, 3, 4]
minimumBribes(q:q)
