func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    let base = Array(0...m*t).flatMap{ Array(String($0, radix: n)) }
    var result = ""
    
    for i in stride(from: p, to: p + (t * m), by: m) {
        result += base[i - 1].uppercased()
    }
    
    return result
}
