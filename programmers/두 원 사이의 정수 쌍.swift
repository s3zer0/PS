import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var answer: Int = 0
    
    for i in 1...r2 {
        let y2 = Int(sqrt(pow(Double(r2), 2) - pow(Double(i), 2)))
        var y1 = 0.0
        if i < r1 {
            y1 = ceil(sqrt(pow(Double(r1), 2) - pow(Double(i), 2)))
        }
        
        answer += y2 - Int(y1) + 1
    }
    
    return Int64(answer) * 4
}
