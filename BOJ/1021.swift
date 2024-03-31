import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var outNumbers = readLine()!.split(separator: " ").map{Int(String($0))!}

var arr = Array(1...input[0])
var np = 0
var answer = 0

for outNumber in outNumbers {
    let findPoint = arr.firstIndex(of: outNumber)!
    var rightMoveDistance = findPoint - np, leftMoveDistance = arr.count - rightMoveDistance
    
    if findPoint < np {
        leftMoveDistance = np - findPoint
        rightMoveDistance = arr.count - leftMoveDistance
    }
    
    let distance = leftMoveDistance > rightMoveDistance ? rightMoveDistance : leftMoveDistance
    answer += distance
    
    np = findPoint
    arr.remove(at: findPoint)
}

print(answer)
