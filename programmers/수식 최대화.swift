import Foundation

func solution(_ expression:String) -> Int64 {
    var numbers = [Int]()
    var operators = [Character]()
    var str = ""
    
    for c in expression {
        if c.isNumber {
            str += String(c)
        } else {
            numbers.append(Int(str)!)
            operators.append(c)
            str = ""
        }
    }
    numbers.append(Int(str)!)
    
    func calculate(_ priority: [Character]) -> Int64 {
        var tempNumbers = numbers
        var tempOperators = operators
        
        for op in priority {
            var calculatedIndexs = [Int]()
            
            for i in tempOperators.indices {
                if tempOperators[i] == op {
                    var result: Int = 0
                    
                    switch op {
                    case "+":
                        result = tempNumbers[i] + tempNumbers[i + 1]
                    case "-":
                        result = tempNumbers[i] - tempNumbers[i + 1]
                    case "*":
                        result = tempNumbers[i] * tempNumbers[i + 1]
                    default:
                        print("error")
                    }
                    
                    tempNumbers[i + 1] = result
                    calculatedIndexs.append(i)
                }
            }
            
            for i in calculatedIndexs.reversed() {
                tempNumbers.remove(at: i)
                tempOperators.remove(at: i)
            }
        }
        
        return Int64(abs(tempNumbers[0]))
    }
    
    let priorityArray: [[Character]] = [["+", "*", "-"], ["+", "-", "*"], ["*", "+", "-"], ["*", "-", "+"], ["-", "*", "+"], ["-", "+", "*"]]
    var answer: Int64 = -1
    
    for priority in priorityArray {
        let sum = calculate(priority)
        
        if sum > answer {
            answer = sum
        }
    }
    
    return answer
}
