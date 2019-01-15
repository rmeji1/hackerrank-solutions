//
//  sock-merchant.swift
//  
//
//  Created by robert on 1/2/19.
//

import Foundation

// Complete the sockMerchant function below.
func sockMerchant(n: Int, ar: [Int]) -> Int {
  var dictionary = [Int: Int]()
  
  for item in ar{
    if var _ = dictionary[item]{
      dictionary[item]! += 1
    }else{
      dictionary[item] = 1
    }
  }
  
  var pairs = 0
  for socksColor in dictionary.values{
    pairs += socksColor / 2
  }
  
  return pairs
}
