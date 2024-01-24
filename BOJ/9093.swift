import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let str = readLine()!.split(separator: " ").map{String($0)}
    var rev_str = ""
    
    for word in str {
        rev_str += word.reversed()
        rev_str += " "
    }
    
    print(rev_str)
}
