let n = Int(readLine()!)!
var stack = [Int]()
var answer = 0

for _ in 0..<n {
    let h = Int(readLine()!)!
    
    while !stack.isEmpty && stack.last! <= h {
        stack.removeLast()
        answer += stack.count
    }
    
    stack.append(h)
}

if stack.count != 1 {
    answer += stack.count * (stack.count - 1) / 2
}

print(answer)
