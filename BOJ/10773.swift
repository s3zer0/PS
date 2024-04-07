let n = Int(readLine()!)!

var stack = [Int]()
var answer = 0

for _ in 0..<n {
    let input = Int(readLine()!)!
    
    if input == 0 {
        let popped = stack.popLast()!
        answer -= popped
    } else {
        stack.append(input)
        answer += input
    }
}

print(answer)
