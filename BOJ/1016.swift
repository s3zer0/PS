import Foundation

let input = readLine()!.split(separator: " ").map { Int64($0)! }
let minVal = input[0]
let maxVal = input[1]

var isDivisible = [Bool](repeating: false, count: Int(maxVal - minVal + 1))

var i: Int64 = 2
while i * i <= maxVal {
    let square = i * i
    let start = ((minVal + square - 1) / square) * square
    
    stride(from: start, through: maxVal, by: Int64.Stride(square)).forEach { num in
        isDivisible[Int(num - minVal)] = true
    }
    i += 1
}

let result = Int64(isDivisible.filter { !$0 }.count)
print(result)
