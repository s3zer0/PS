import Foundation

let input = readLine()!.map{String($0)}

var stick = 0
var answer = 0

for i in 0..<input.count {
    if input[i] == "(" {
        stick += 1
    } else {
        stick -= 1
        
        if input[i-1] == "(" {
            answer += stick
        } else {
            answer += 1
        }
    }
}

print(answer)
