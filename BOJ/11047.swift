let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var targetValue = input[1]
var coinType = [Int]()

for _ in 0..<input[0] {
    let coin = Int(readLine()!)!
    if coin > targetValue {
        break
    }
    
    coinType.append(coin)
}

var result = 0
for c in coinType.reversed() {
    while targetValue - c >= 0 {
        targetValue -= c
        result += 1
    }
}

print(result)
