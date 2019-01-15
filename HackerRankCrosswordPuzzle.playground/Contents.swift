//: Playground - noun: a place where people can play
import UIKit

//enum Direction{
//  case horizontal
//  case vertical
//}
//// Complete the crosswordPuzzle function below.
//func fill(words:[Substring], crossword: [Substring], crosswordIndex: Int, crosswordOffset: Int, direction: Direction) -> [Substring]{
//  var localCrossword = crossword
//
////  print(crossword[1])
//  for wordsIndex in 0..<words.count{ // get the word
//    let word = words[wordsIndex]
//    var row = crosswordIndex
//    var colOffset = crosswordOffset
//    var wordOffset = 0
//
//    // indicies
//    var column = crossword[row].index(crossword[row].startIndex, offsetBy: colOffset)
//    var characterIndex = word.index(word.startIndex, offsetBy: wordOffset)
//
//    if word.first != localCrossword[row][column] &&  localCrossword[row][column] != "-"{
//      continue
//    }
//
//    while localCrossword[row][column] != "+"{
//      if characterIndex == word.endIndex{
//        print("calling break")
//        break
//      }
//
//      // replace character
//      if localCrossword[row][column] != word[characterIndex]{
//        localCrossword[row].replaceSubrange(column...column, with: String(word[characterIndex]))
//      }
//
//      if direction == Direction.vertical{
//        // check horiztontal while here
//        column = crossword[row].index(crossword[row].startIndex, offsetBy: colOffset+1)
//        if localCrossword[row][column] == "-"{
//          let wordsToSend = words.filter{
//             $0 != word
//          }
//          localCrossword = fill(words:wordsToSend, crossword: localCrossword, crosswordIndex: row,
//               crosswordOffset: colOffset, direction: Direction.horizontal)
//        }
//        row += 1
//      }else{
//        colOffset += 1
//      }
//      column = crossword[row].index(crossword[row].startIndex, offsetBy: colOffset)
//
//      // move to next character
//      wordOffset += 1
//      characterIndex = word.index(word.startIndex, offsetBy: wordOffset)
//    }
//    if characterIndex == word.endIndex && localCrossword[row][column] == "+"{
//      break
//    }
//  }
//  return localCrossword
//}
//
//
//func crosswordPuzzle(crossword: [Substring], words: String) -> [String] {
//  var localCrossword = crossword
//  // split words
//  let splitWords = words.split(separator:";")
//
//  for lineIndex in 0..<10{
//    let line = localCrossword[lineIndex]
//     //print(line)
//    for offset in 0..<10 {
//      let index = line.index(line.startIndex, offsetBy: offset)
//      if line[index] == "-"{
//        if line[line.index(line.startIndex, offsetBy: offset+1)] == "-"{
//          localCrossword = fill(words:splitWords, crossword: localCrossword, crosswordIndex: lineIndex,
//               crosswordOffset: offset, direction: Direction.horizontal)
//        }else{
//          localCrossword = fill(words:splitWords, crossword: localCrossword, crosswordIndex: lineIndex,
//               crosswordOffset: offset, direction: Direction.vertical)
//        }
//
//        for row in localCrossword{
//          print(row)
//        }
//
//        //print("fill the word")
//      }
//    }
//  }
//  return []
//}
enum Direction{
  case horizontial
  case vertical
}

func fill(crossword: [Substring], row:Int, colOffSet: Int, word: Substring) -> [Substring]?{
  // figure out if im going horiztonal or vertical
  var localOffset = colOffSet
  var localRow = row
  var localCrossword = crossword
  var direction : Direction
  var column = crossword[row].index(crossword[row].startIndex, offsetBy: localOffset+1)
  
  if crossword[row][column] == "-"{
    if colOffSet != 0{
      column = crossword[row].index(crossword[row].startIndex, offsetBy: localOffset-1)
      if crossword[row][column] != "+" {
        localOffset -= 1
      }
    }
    direction = Direction.horizontial
  }else{
    if localRow != 0{
      //localRow -= 1
      
      column = crossword[localRow-1].index(crossword[localRow-1].startIndex, offsetBy: localOffset)
      if crossword[localRow-1][column] != "+" {
        localRow -= 1
      }
    }
    direction = Direction.vertical
  }
  
  // now start inserting
  var wordOffset: Int = 0
  var index = word.index(word.startIndex, offsetBy: wordOffset)
  
  column = crossword[localRow].index(crossword[localRow].startIndex, offsetBy: localOffset)
  
  
  if word.first != localCrossword[localRow][column] &&
    localCrossword[row][column] != "-" {
    return nil
  }
  
  while localCrossword[localRow][column] != "+"{
    if (index == word.endIndex){ // word doesn't fill.
      return nil
    }
    
    localCrossword[localRow].replaceSubrange(column...column, with: String(word[index]))
    
    if direction == .horizontial{
      localOffset += 1
    }else{
      localRow += 1
    }
    wordOffset += 1
    index = word.index(word.startIndex, offsetBy: wordOffset)

    if localOffset > 9 || localRow > 9{ break }
    column = localCrossword[localRow].index(crossword[localRow].startIndex, offsetBy: localOffset)
    }
  
  if index != word.endIndex{
    return nil
  }
  return localCrossword
}




func crosswordPuzzle(crossword: [Substring], words: String, row: Int, column: Int) -> [Substring]{
  var localCrossword = crossword
  var wordsLocal = words.split(separator: ";")
  
  for row in 0..<crossword.count{
    for colOffset in 0..<localCrossword[row].count{
      let column = localCrossword[row].index(crossword[row].startIndex, offsetBy: colOffset)
      if localCrossword[row][column] == "-"{
        for index in 0..<wordsLocal.count{
          if let tempCrossword = fill(crossword: localCrossword, row: row, colOffSet: colOffset, word: wordsLocal[index]){
            localCrossword = tempCrossword
            wordsLocal.remove(at: index)
            
            if wordsLocal.count != 0 {
              return crosswordPuzzle(crossword: localCrossword, words: wordsLocal.joined(separator: ";")
                , row: row, column: colOffset)
            }
          }
        }
      }
    }
    
  }
  return localCrossword
}


func crosswordPuzzle(crossword: [Substring], words: String) -> [Substring] {
  
  //  for row in crossword
  return crosswordPuzzle(crossword: crossword, words: words, row: 0, column: 0)
}

var string = """
+-++++++++
+-++-+++++
+-------++
+-++-+++++
+-++-+++++
+-++-+++++
++++-+++++
++++-+++++
++++++++++
----------
"""



let crossword = string.split(separator: "\n")
let words = "CALIFORNIA;NIGERIA;CANADA;TELAVIV"

var cross = crosswordPuzzle(crossword: crossword, words: words)
for row in cross{
  print(row)
}




