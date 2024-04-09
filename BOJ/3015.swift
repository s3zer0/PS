import Foundation

let n = Int(readLine()!)!
var stack = [(Int, Int)]()  //(height, count)

var result = 0
for _ in 0..<n {
    let h = Int(readLine()!)!
    var temp = (h, 1)
    
    while !stack.isEmpty && stack.last!.0 <= h {
        result += stack.last!.1
        
        if stack.last!.0 == h {
            temp.1 += stack.last!.1
        }
        stack.removeLast()
    }
    
    if !stack.isEmpty { result += 1 }
    stack.append(temp)
}

print(result)
