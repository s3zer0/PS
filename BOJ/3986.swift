import Foundation

let n = Int(readLine()!)!

var cnt = 0
for _ in 0..<n {
    let input = Array(readLine()!)
    var stack = [Character]()
    
    for i in input {
        if !stack.isEmpty && stack.last! == i {
            stack.removeLast()
        } else {
            stack.append(i)
        }
    }
    
    if stack.isEmpty {
        cnt += 1
    }
}

print(cnt)
