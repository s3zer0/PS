import Foundation

func solution(_ cards: [Int]) -> Int {
    var n = cards.count
    var visited = [Bool](repeating: false, count: cards.count)
    var cycleLengthes = [Int]()

    for i in 0..<n {
        if !visited[i] {
            var current = i
            var cycleLength = 0
            
            while !visited[current] {
                visited[current] = true
                current = cards[current] - 1
                cycleLength += 1
            }
            
            if cycleLength == n { return 0 }
            
            cycleLengthes.append(cycleLength)
        }
    }
    
    cycleLengthes.sort(by: >)
    return cycleLengthes[0] * cycleLengthes[1]
}
