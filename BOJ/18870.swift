import Foundation

let n = Int(readLine()!)!
var coordinate = readLine()!.split(separator: " ").map{Int(String($0))!}
var dict = [Int: Int]()
var cnt = 0

for i in coordinate.sorted(by: <) {
    if dict[i] == nil {
        dict[i] = cnt
        cnt += 1
    }
}

print(coordinate.map{String(dict[$0]!)}.joined(separator: " "))
