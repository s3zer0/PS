import Foundation

func addElement(_ base: [Int: Int], _ arr: [Int]) -> [Int: Int] {
    var result = [Int: Int]()
    
    for (key, value) in base {
        for value1 in arr { result[key + value1, default: 0] += value }
    }
    
    return result
}


func rollDice(_ dice: [[Int]], indexArr:[Int]) -> [Int: Int] {
    var dict = [0: 1]
    
    for i in indexArr {
        dict = addElement(dict, dice[i])
    }
    
    return dict
}

func calcOdds(_ a: [Int: Int], _ b: [Int: Int]) -> [Int] {
    var result = [0, 0]
    
    for (key, value) in a {
        for (key2, value2) in b {
            if key > key2 { result[0] += value * value2 }
            if key < key2 { result[1] += value * value2 }
        }
    }
    
    return result
}

func combination(_ array: [Int], _ n: Int) -> [[Int]] {
    var result = [[Int]]()
    if array.count < n { return result }
    
    func cycle(_ index: Int, _ now: [Int]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }
        
    cycle(0, [])
        
    return result
}


func solution(_ dice:[[Int]]) -> [Int] {
    let n = dice.count
    var answer = (arr: Array(repeating: 0, count: n / 2), rate: 0)
    let diceCases = combination(Array(0..<n), n / 2)
    
    for i in 0..<diceCases.count / 2 {
        let a = rollDice(dice, indexArr: diceCases[i])
        let b = rollDice(dice, indexArr: diceCases[diceCases.count - 1 - i])
        
        let win = calcOdds(a, b)
        
        if win[0] > answer.rate { answer = (diceCases[i].map{$0 + 1}, win[0]) }
        if win[1] > answer.rate { answer = (diceCases[diceCases.count - 1 - i].map{$0 + 1}, win[1]) }
    }
    
    return answer.arr
}
