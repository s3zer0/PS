func solution() -> Bool {
    let input = readLine()!.split(separator: " ")
    let originalStr = Array(input[0]).sorted(by: <), changedStr = Array(input[1]).sorted(by: <)
    
    if originalStr.count != changedStr.count { return false }
    
    for i in originalStr.indices {
        if originalStr[i] != changedStr[i] {
            return false
        }
    }
    
    return true
}


let n = Int(readLine()!)!

for _ in 0..<n {
    if solution() {
        print("Possible")
    } else {
        print("Impossible")
    }
}
