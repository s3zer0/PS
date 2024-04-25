import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var totalSum = 0
    var sumOfQueue1 = 0, sumOfQueue2 = 0
    var queue1 = queue1, queue2 = queue2
    var maxTestCount = queue1.count * 4
    
    queue1.forEach {
        totalSum += $0
        sumOfQueue1 += $0
    }
    queue2.forEach {
        totalSum += $0
        sumOfQueue2 += $0
    }
    
    if totalSum % 2 != 0 { return -1 }
    
    var targetNumber = totalSum / 2
    var result = 0
    
    var idx1 = 0, idx2 = 0
    
    while sumOfQueue1 != sumOfQueue2 {
        if sumOfQueue1 < targetNumber {
            let num = queue2[idx2]
            sumOfQueue2 -= num
            queue1.append(num)
            sumOfQueue1 += num
            idx2 += 1
        } else if sumOfQueue1 > targetNumber {
            let num = queue1[idx1]
            sumOfQueue1 -= num
            queue2.append(num)
            sumOfQueue2 += num
            idx1 += 1
        }
        
        result += 1
        
        if result == maxTestCount {
            return -1
        }
    }
    
    return result
}
