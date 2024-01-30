import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    let times = times.sorted(by: <)
    var maxTime = times.last! * n, minTime = 1
    var midTime = 0
    var result = 0
    
    while minTime <= maxTime {
        midTime = (maxTime + minTime) / 2
        var sum = 0 //인원수
        
        for time in times {
            sum += midTime / time
        }
        
        if sum < n {    //인원이 목표치에 도달하지 못함. 다시 검사 필요.
            minTime = midTime + 1
        } else {
            result = midTime
            maxTime = midTime - 1
        }
    }
    
    return Int64(result)
}
