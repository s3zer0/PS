import Foundation

let n = Int(readLine()!)!
var stack = [Int]()
var answer = 0

for _ in 0..<n {
    let h = Int(readLine()!)!
    
    if stack.isEmpty {
        stack.append(h)
    } else {
        while !stack.isEmpty && stack.last! <= h {
            stack.removeLast()
            answer += stack.count
        }
        stack.append(h)
    }
}

if stack.count > 1 {
    for _ in 0..<stack.count-1 {
        stack.removeLast()
        answer += stack.count
    }
}

print(answer)
