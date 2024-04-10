import Foundation

var histogram = [Int]()
while true {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let n = input[0]
    if n == 0 { break }
    
    histogram = Array(input[1...n]) + [0]
    
    var result = 0
    var stack = [(Int, Int)]()  //index, height
    for i in histogram.indices {
        var weight = i
        
        while !stack.isEmpty && stack.last!.1 > histogram[i] {
            let popped = stack.popLast()!
            weight = popped.0
            
            result = max(result, (i - weight) * popped.1)
        }
        
        stack.append((weight, histogram[i]))
    }
    
    print(result)
}
