let N = Int(readLine()!)!
let towers = readLine()!.split(separator: " ").map { Int(String($0))! }
var results = Array(repeating: 0, count: N)
var stack = [Int]()

for i in (0..<N).reversed() {
    while !stack.isEmpty && towers[i] > towers[stack.last!] {
        let popped = stack.popLast()!
        results[popped] = i + 1
    }
    stack.append(i)
}

print(results.map{ String($0) }.joined(separator: " "))
