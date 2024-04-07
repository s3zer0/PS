let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
let targetNumber = Int(readLine()!)!

var startIdx = 0, lastIdx = n - 1
var answer = 0

while lastIdx > startIdx {
    var sumNumber = numbers[startIdx] + numbers[lastIdx]
    
    if sumNumber == targetNumber {
        answer += 1
        lastIdx -= 1
    } else {
        if sumNumber > targetNumber { lastIdx -= 1 }
        else { startIdx += 1 }
    }
}

print(answer)
