
import Foundation

var colorArr = [String](), numArr = [Int]()

for _ in 0..<5 {
    let input = readLine()!.split(separator: " ").map{String($0)}
    
    colorArr.append(input[0])
    numArr.append(Int(input[1])!)
}

func isFlush(_ colorArr: [String]) -> Bool {
    var dict: [String:Int] = ["R" : 0, "B" : 0, "Y" : 0, "G" : 0]
    
    for color in colorArr {
        dict[color]! += 1
    }
    
    for (_, value) in dict {
        if value == 5 {
            return true
        }
    }
    
    return false
}

func isStraight(_ arr: [Int]) -> Bool {
    let arr = arr.sorted(by : <)
    
    for i in 0..<4 {
        if arr[i+1] - arr[i] != 1 {
            return false
        }
    }
    
    return true
}

func checkSameCard(_ numArr: [Int]) -> [[Int]] {
    var arr = Array(repeating: 0, count: 10)
    
    for num in numArr {
        arr[num] += 1
    }
    
    var result = [[Int]]()
    
    for i in 0..<arr.count {
        if arr[i] > 1 {
            result.append([i, arr[i]])
        }
    }
    
    return result.sorted { (first, second) in
        if first[1] == second[1] {
            return first[0] > second[0]
        }
        return first[1] > second[1]
    }
}

var score = 0

if isFlush(colorArr) {
    if isStraight(numArr) { //스티플
        score = numArr.sorted(by: <).last! + 900
    } else {    //플러쉬일 경우
        score = numArr.sorted(by:<).last! + 600
    }
}

let temp = checkSameCard(numArr)
var a = 0

if temp.count == 2 {
    a = temp[0][0] * 10 + temp[1][0]
    
    if temp[0][1] == 3 {    //풀하우스
        a += 700
    } else {    //투페어
        a += 300
    }
} else if temp.count == 1 {
    a = temp[0][0]
    
    if temp[0][1] == 4 {    //포카드
        a += 800
    } else if temp[0][1] == 3 { //트리플
        a += 400
    } else {    //원페어
        a += 200
    }
} else {
    if isStraight(numArr) {
        a = numArr.sorted(by: <).last! + 500
    } else {
        //하이카드
        a = numArr.sorted(by: <).last! + 100
    }
}

score = score > a ? score : a

print(score)
