import Foundation

var arr = Array(0...20)

func solution() {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let changedArr = [Int]((arr[input[0]...input[1]]).reversed())
    
    var index = 0
    for i in input[0]...input[1] {
        arr[i] = changedArr[index]
        index += 1
    }
}

for _ in 0..<10 {
    solution()
}

arr.removeFirst()
arr.forEach{
    print($0, terminator: " ")
}
