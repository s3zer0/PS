import Foundation

let m = Int(readLine()!)!

var spin = 1
var spinDir = 0

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}  //i회전수, i+1 회전수, 회전방향
    
    spinDir += input[2]
    spin *= input[1]
    spin /= input[0]
}

print(spinDir % 2, spin)
