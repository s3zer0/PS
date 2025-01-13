import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) { return 0 }
    
    var queue: [(String, Int)] = [(begin, 0)]
    var visited: Set<String> = []
    visited.insert(begin)
    
    func isOneDiff(_ word1: String, _ word2: String) -> Bool {
        let countDiff = zip(word1, word2).filter { $0 != $1 }.count
        return countDiff == 1
    }
    
    while !queue.isEmpty {
        let (currentWord, step) = queue.removeFirst()
        
        if currentWord == target {
            return step
        }
        
        for w in words {
            if !visited.contains(w) && isOneDiff(currentWord, w) {
                visited.insert(w)
                queue.append((w, step + 1))
            }
        }
    }
    
    return 0
}
