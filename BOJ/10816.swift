import Foundation

let n = Int(readLine()!)!
var number_cards = readLine()!.split(separator: " ").map{Int(String($0))!}

let m = Int(readLine()!)!
var check_numbers = readLine()!.split(separator: " ").map{Int(String($0))!}

var dict = [Int: Int]()
for number_card in number_cards {
    if dict.keys.contains(number_card) {
        dict[number_card]! += 1
    } else {
        dict[number_card] = 1
    }
}

var result = [Int]()
for check_number in check_numbers {
    if dict.keys.contains(check_number) {
        result.append(dict[check_number]!)
    } else {
        result.append(0)
    }
}

print(result.map{String($0)}.joined(separator: " "))
