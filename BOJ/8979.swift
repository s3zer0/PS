import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var arr = [[Int]]()

for _ in 0..<input[0] {
    arr.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

let sortedArr = arr.sorted { (first, second) in
    if first[1] == second[1] {
        if first[2] == second[2] {
            return first[3] > second[3]
        }
        return first[2] > second[2]
    }
    return first[1] > second[1]
}

var rank = 1
var temp = 1

if sortedArr[0][0] == input[1] {
    print(1)
} else {
    for i in 1..<arr.count {
        if sortedArr[i][1...3] != sortedArr[i-1][1...3] {
            //print(sortedArr[i-1], sortedArr[i])
            rank += temp
            temp = 1
        } else {
            temp += 1
        }
        
        if sortedArr[i][0] == input[1] {
            print(rank)
            break
        }
    }
}
