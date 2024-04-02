import Foundation

let input = readLine()!.map{String($0)}
var stack = [String]()

var result = 0
var temp = 1

var chk = true

for i in input.indices {
    
    if input[i] == "(" {
        temp *= 2
        stack.append(input[i])
    } else if input[i] == "[" {
        temp *= 3
        stack.append(input[i])
    }
    
    if input[i] == ")" {
        if stack.isEmpty || stack.last != "(" {
            chk = false
            break
        }
        
        if input[i-1] == "(" {
            result += temp
        }
        stack.removeLast()
        temp /= 2
    } else if input[i] == "]" {
        if stack.isEmpty || stack.last != "[" {
            chk = false
            break
        }
        
        if input[i-1] == "[" {
            result += temp
        }
        stack.removeLast()
        temp /= 3
    }
}

if chk && stack.isEmpty {
    print(result)
} else {
    print(0)
}
