import Foundation

public class Tries{
  
  private class TrieNode{
    var children = [Character:TrieNode]()
    var numberOfOccurences = 0
  }
  
  private let root = TrieNode()
  
  func insert(_ value : String){
    var pCrawl = root
    for character in value{
      if pCrawl.children[character] == nil{
        pCrawl.children[character] = TrieNode()
      }
      pCrawl = pCrawl.children[character]!
      pCrawl.numberOfOccurences += 1
    }
  }
  
  func search(_ value : String) -> Int{
    var pCrawl = root
    for char in value{
      if let node = pCrawl.children[char] { pCrawl = node }
      else{ return 0 }
    }
    return pCrawl.numberOfOccurences
  }
}


let trie = Tries()
trie.insert("eouecvksgllpvfxfvndu")
print(trie.search("zivh"))
trie.insert("hacker")
print(trie.search("hac"))

