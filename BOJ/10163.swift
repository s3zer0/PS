import Foundation

let n = Int(readLine()!)!
var arr = Array(repeating: Array(repeating: -1, count: 1001), count: 1001)   //[y][x]

for idx in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!} //x, y, 너비, 높이
    
    for i in input[1]..<input[1]+input[3] {    //y
        for j in input[0]..<input[0]+input[2] {    //x
            arr[i][j] = idx
        }
    }
}

var result = Array(repeating: 0, count: n)

for i in 0..<arr.count {
    for j in 0..<arr[0].count {
        if arr[i][j] != -1 {
            result[arr[i][j]] += 1
        }
    }
}

result.forEach {
    print($0)
}
