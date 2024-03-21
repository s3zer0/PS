import Foundation

var arr: [[Bool]] = Array(repeating: Array(repeating: false, count: 102), count: 102)
var answer = 0

for _ in 0..<4 {
    let square = readLine()!.split(separator: " ").map{Int(String($0))!}
    let x = square[0]...(square[2] - 1), y = square[1]...(square[3] - 1)
    
    for i in y {
        for j in x {
            if !arr[i][j] {
                answer += 1
            }
            
            arr[i][j] = true
        }
    }
}

print(answer)
