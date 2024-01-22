import Foundation

var stack = [Int]()

func push(_ x: Int) {
    stack.append(x)
}

func pop() -> Int {
    let returnValue = top()
    if stack.isEmpty != true {
        stack.removeLast()
    }
    
    return returnValue
}

func size() -> Int {
    return stack.count
}

func empty() -> Int {
    if stack.isEmpty { return 1 }
    else { return 0 }
}

func top() -> Int {
    if stack.isEmpty {
        return -1
    }
    
    let returnValue = stack.last!
    return returnValue
}

let n = Int(readLine()!)!

for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map{String($0)}
    let command = input[0]
    
    if command == "push" {
        let value = Int(input[1])!
        push(value)
    }
    else if command == "pop" { print(pop()) }
    else if command == "size" { print(size()) }
    else if command == "empty" { print(empty()) }
    else if command == "top" { print(top()) }
}
