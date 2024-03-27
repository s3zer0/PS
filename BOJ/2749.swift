import Foundation

let n: UInt64 = UInt64(readLine()!)!
let target = n % 1500000

var arr: [Int] = [0, 1]

if n <= 1 {
    print(n)
} else {
    for _ in 2...target {
        let temp = (arr[1] + arr[0]) % 1000000
        arr[0] = arr[1]
        arr[1] = temp
    }
    
    print(arr[1])
}
