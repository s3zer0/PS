let n = Int(readLine()!)!
var card = readLine()!.split(separator: " ").map{Int($0)!}
card.sort(by: >)

var result = 0
for i in 1..<n {
    result += card[0] + card[i]
}

print(result)
