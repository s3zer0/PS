import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let ps = Array(readLine()!)
    var cnt = 0
    
    for c in ps {
        if c == "(" {cnt += 1}
        else if c == ")" {cnt -= 1}
        
        if cnt < 0 { break }
    }
    
    if cnt == 0 {print("YES")}
    else {print("NO")}
}
