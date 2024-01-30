import Foundation

let input = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
let k = input[0], n = input[1]  //target = n

var lanLengths = [Int]()
for _ in 0..<k {
    lanLengths.append(Int(readLine()!)!)
}

var start = 1, end = lanLengths.max()!, mid = 0

var result = 0

while start <= end {
    mid = (start + end) / 2
    var cnt = 0
    
    for lanLength in lanLengths {
        cnt += lanLength / mid
    }
    
    if cnt >= n {
        if result < mid {
            result = mid
        }
        start = mid + 1
    } else {  //개수가 적으면 자르는 길이를 줄여야함.
        end = mid - 1
    }
}

print(result)
