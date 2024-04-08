import Foundation

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map{Int(String($0))!}
var stack = [Int]()

for i in arr.indices {
    while !stack.isEmpty && arr[stack.last!] < arr[i] {
        arr[stack.removeLast()] = arr[i]
    }
    
    stack.append(i)
}

for i in stack {
    arr[i] = -1
}

print(arr.map{String($0)}.joined(separator: " "))
