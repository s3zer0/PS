import Foundation

func solution(_ arr: [String]) -> Int {
    let n = arr.count / 2 + 1 // 숫자의 개수
    let numbers = stride(from: 0, to: arr.count, by: 2).map { Int(arr[$0])! } // 숫자 배열
    let operators = stride(from: 1, to: arr.count, by: 2).map { arr[$0] } // 연산자 배열
    
    // dp[i][j]는 i부터 j까지의 부분 식의 최소값과 최대값을 저장
    var minDP = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    var maxDP = Array(repeating: Array(repeating: Int.min, count: n), count: n)
    
    // 초기값: 각 숫자 자신은 최소값이자 최대값
    for i in 0..<n {
        minDP[i][i] = numbers[i]
        maxDP[i][i] = numbers[i]
    }
    
    // 길이가 2 이상인 부분 문제 해결
    for len in 1..<n {
        for i in 0..<n-len {
            let j = i + len
            for k in i..<j {
                let op = operators[k]
                // 가능한 모든 경우의 수 계산
                let candidates = [
                    calculate(maxDP[i][k], maxDP[k+1][j], op),
                    calculate(maxDP[i][k], minDP[k+1][j], op),
                    calculate(minDP[i][k], maxDP[k+1][j], op),
                    calculate(minDP[i][k], minDP[k+1][j], op)
                ]
                minDP[i][j] = min(minDP[i][j], candidates.min()!)
                maxDP[i][j] = max(maxDP[i][j], candidates.max()!)
            }
        }
    }
    
    return maxDP[0][n-1] // 전체 식의 최대값 반환
}

// 연산 수행 함수
func calculate(_ a: Int, _ b: Int, _ op: String) -> Int {
    if op == "+" {
        return a + b
    } else {
        return a - b
    }
}
