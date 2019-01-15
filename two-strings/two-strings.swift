//
//  two-strings.swift
//  
//
//  Created by robert on 1/2/19.
//

import Foundation

// Complete the twoStrings function below.
func twoStrings(s1: String, s2: String) -> String {
  // create an empty map
  var map = [Character:Int]()
  
  for index in s1.indices{
    let currentCharacter = s1[index]
    if map[currentCharacter] == nil{
      map[currentCharacter] = 1
    }else{
      map[currentCharacter]! += 1
    }
  }
  
  for index in s2.indices{
    let currentCharacter = s2[index]
    if let inMap = map[currentCharacter]{
      return "YES"
    }
  }
  
  return "NO"
}
