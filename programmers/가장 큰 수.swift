import Foundation

func solution(_ numbers:[Int]) -> String {
    let sortedNumbers = numbers.map{String($0)}.sorted(by: { $0 + $1 > $1 + $0 })
    return sortedNumbers[0] == "0" ? "0" : sortedNumbers.joined(separator: "")
}
