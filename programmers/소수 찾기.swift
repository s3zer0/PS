import Foundation

func isPrime(_ number: Int) -> Bool {
    if number < 2 { return false }
    if number < 4 { return true }
    
    for i in 2..<Int(sqrt(Double(number)) + 1) {
        if number % i == 0 { return false }
    }
    
    return true
}

func permutation(_ target: [String], _ targetNum: Int) -> [Int] {
    var result: [[String]] = []
    var check = [Bool](repeating: false, count: target.count)
    
    func permute(_ arr: [String]) {
        if arr.count == targetNum {
            result.append(arr)
            return
        }
        for i in 0..<target.count {
            if check[i] == true {
                continue
            } else {
                check[i] = true
                permute(arr + [target[i]])
                check[i] = false
            }
        }
    }
    
    permute([])
    
    return result.map{ Int($0.joined())! }
}

func solution(_ numbers:String) -> Int {
    let numberArray: [String] = Array(numbers).map{String($0)}
    var primeCounts = 0
    
    var allCases: [Int] = []
    
    for i in 1...numberArray.count {
        let permutations = Set(permutation(numberArray, i))
        allCases.append(contentsOf: permutations)
    }
    
    let setAllCases = Set(allCases)
    
    for number in setAllCases {
        if isPrime(number) { primeCounts += 1 }
    }
    
    return primeCounts
}

print(solution("17"))
print(solution("011"))
