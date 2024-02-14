import Foundation

let n = Int(readLine()!)!
var meetingTime = [(Int, Int)]() //start, end

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    meetingTime.append((input[0], input[1]))
}

meetingTime.sort{ (first, second) in
    if first.1 == second.1 {
        return first.0 < second.0
    }
    return first.1 < second.1
}

var nowPoint = -1   //0에서 시작하는 경우도 있으므로 초기값은 -1로 설정
var result = 0

for i in 0..<n {
    if nowPoint <= meetingTime[i].0 {
        nowPoint = meetingTime[i].1
        result += 1
    }
}

print(result)
