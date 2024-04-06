import Foundation

let input = Array(readLine()!)
var arr = Array(repeating: 0, count: 26)

for c in input {
    let idx = Int(Unicode.Scalar(String(c))!.value) - 97
    
    if idx >= 0 {
        arr[idx] += 1
    }
}

arr.forEach {
    print($0, terminator: " ")
}
