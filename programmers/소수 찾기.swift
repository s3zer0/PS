import Foundation

func isPrime(_ number: Int) -> Bool {
    if number < 2 { return false }
    if number < 4 { return true }
    
    if number % 2 == 0 { return false }
    
    let limit = Int(sqrt(Double(number)))
    for i in stride(from: 3, through: limit, by: 2) {
        if number % i == 0 { return false }
    }
    
    return true
}

func generatePermutations(_ numbers: [String], _ current: String, _ visited: inout [Bool], _ result: inout Set<Int>) {
    if !current.isEmpty {
        result.insert(Int(current)!)
    }
    
    for i in 0..<numbers.count {
        if visited[i] { continue }
        visited[i] = true
        generatePermutations(numbers, current + numbers[i], &visited, &result)
        visited[i] = false
    }
}

func solution(_ numbers: String) -> Int {
    let numberArray = Array(numbers).map { String($0) }
    var visited = [Bool](repeating: false, count: numberArray.count)
    var uniqueNumbers = Set<Int>()
    
    generatePermutations(numberArray, "", &visited, &uniqueNumbers)
    
    return uniqueNumbers.filter(isPrime).count
}
