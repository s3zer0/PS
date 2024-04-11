import Foundation

let n = Int(readLine()!)!
var pos = 2

while true {
    if n == 1 || n == 2 {
        print(n)
        break
    }
    
    pos *= 2
    if pos >= n {
        print((n - (pos / 2)) * 2)
        break
    }
}
