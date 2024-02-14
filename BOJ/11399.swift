import Foundation

let n = Int(readLine()!)!
var p = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
var answer = 0, t = 0

p.forEach {
    t += $0
    answer += t
}

print(answer)
