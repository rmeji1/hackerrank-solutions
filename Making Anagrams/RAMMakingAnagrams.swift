import Foundation

print("running swift")

// considered anagram if first word letters can be rearanged to form second word

func makeAnagram( a: String, b: String) -> Int{
    var numberOfRemovals = 0
    var frequence = Array(repeating: 0, count: 26)

    for (_ , uc) in a.lowercased().unicodeScalars.enumerated() { 
      frequence[Int(uc.value - UnicodeScalar("a").value)] += 1 
    }
    for (_ , uc) in b.lowercased().unicodeScalars.enumerated() {
      frequence[Int(uc.value - UnicodeScalar("a").value)] -= 1 
    }
    for value in frequence { numberOfRemovals += abs(value) }
    
    return numberOfRemovals 
}




guard let a = readLine() else { fatalError("Bad input") }
guard let b = readLine() else { fatalError("Bad input") }

let res = makeAnagram(a: a, b: b)
print(res)


//fileHandle.write(String(res).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)
