import Foundation

let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted(by: <)
let m = Int(readLine()!)!
let checkNumbers = readLine()!.split(separator: " ").map{Int(String($0))!}

for i in 0..<m {
    var start = 0, end = n - 1, mid = 0
    var chk = false
    
    while start <= end {
        mid = (start + end) / 2
        
        if a[mid] > checkNumbers[i] {
            end = mid - 1
        }
        else if a[mid] < checkNumbers[i] {
            start = mid + 1
        }
        else {
            chk = true
            break
        }
    }
    
    chk == true ? print(1) : print(0)
}
