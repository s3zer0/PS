import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
    
    func bfs(_ leftNumbers: [Int], _ sum: Int) {
        var leftNumbers = leftNumbers
        
        if leftNumbers.isEmpty && sum == target {
            answer += 1
        } else {
            let popped = leftNumbers.removeFirst()
            
            bfs(leftNumbers, sum + popped)
            bfs(leftNumbers, sum - popped)
        }
    }
    
    bfs(numbers, 0)
    
    return answer
}
