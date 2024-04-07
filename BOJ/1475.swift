import Foundation

var numbers = Array(repeating: 0, count: 10)
let input = Array(readLine()!)

for i in input {
    let value = Int(String(i))!
    
    if value == 6 || value == 9 {
        let idx = numbers[6] > numbers[9] ? 9 : 6
        numbers[idx] += 1
        continue
    }
    
    numbers[value] += 1
}

print(numbers.max()!)
