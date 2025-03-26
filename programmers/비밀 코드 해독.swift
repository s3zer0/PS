import Foundation

func solution(_ n: Int, _ q: [[Int]], _ ans: [Int]) -> Int {
    // 1부터 n까지의 숫자에서 5개를 선택하는 모든 조합을 생성하는 함수
    func generateCombinations(_ numbers: [Int], _ count: Int, _ index: Int, _ current: [Int], _ result: inout [[Int]]) {
        if current.count == count {
            result.append(current)
            return
        }
        if index >= numbers.count {
            return
        }
        var newCurrent = current
        newCurrent.append(numbers[index])
        generateCombinations(numbers, count, index + 1, newCurrent, &result)
        generateCombinations(numbers, count, index + 1, current, &result)
    }
    
    // 1부터 n까지의 배열 생성
    let numbers = Array(1...n)
    var combinations: [[Int]] = []
    generateCombinations(numbers, 5, 0, [], &combinations)
    
    // 각 조합이 주어진 시도와 응답을 만족하는지 확인
    var possibleCodes = 0
    
    for code in combinations {
        var isValid = true
        for i in 0..<q.count {
            let attempt = q[i]
            let response = ans[i]
            // 현재 시도와 비밀 코드의 교집합 개수 계산
            let matchCount = Set(code).intersection(Set(attempt)).count
            if matchCount != response {
                isValid = false
                break
            }
        }
        if isValid {
            possibleCodes += 1
        }
    }
    
    return possibleCodes
}
