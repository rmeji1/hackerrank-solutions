import Foundation

public class Tries{

    private class TrieNode{
        var children = [Character:TrieNode]()
        var isEnd: Bool = false 
    }

    private let root : TrieNode

    init(){
        self.root = TrieNode() // Create an empty trieNode 
    }

    func insert(_ value : String){
        var pCrawl = root
        
        for character in value{
            if pCrawl.children[character] == nil{
                pCrawl.children[character] = TrieNode()
                //print("Just inserted \(character)")
            }
            pCrawl = pCrawl.children[character]!
        }

        //set endOfWord
        pCrawl.isEnd = true 
    }

    private func searchForEndOfWord(start pCrawl: TrieNode) -> Int{
        
        // Base case: if children is empty and its end of word 
        if pCrawl.children.isEmpty { return 1 }
        // if is end of a word but has children
        var retValue = 0 
        if pCrawl.isEnd { retValue += 1 }

        // for each child call this function and add return value to retvalue
        for (_ , childNode) in pCrawl.children{
            retValue += searchForEndOfWord(start: childNode)
        }

        return retValue 
        
    }

    func search(_ value : String) -> Int{
        var pCrawl = root
        for char in value{
            if let node = pCrawl.children[char] { pCrawl = node }
            else{
                // we don't have search value so end.
                return 0 
            }
        }

        // pCrawl should be c
        return searchForEndOfWord(start: pCrawl);
    }
}


let trie = Tries()
trie.insert("eouecvksgllpvfxfvndu")
print(trie.search("zivh"))
trie.insert("hacker")
print(trie.search("hac"))

