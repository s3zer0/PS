import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]
var arr = Array(1...n)

var Josephus_permutation = [Int]()
var pos = k

while !arr.isEmpty {
    if pos <= arr.count {
        Josephus_permutation.append(arr[pos-1])
        arr.remove(at: pos - 1)
        pos += k - 1
    }
    else {
        pos -= arr.count
    }
}

print("<" + Josephus_permutation.map({String($0)}).joined(separator: ", ") + ">")
