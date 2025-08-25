import Foundation

func timeToMin(_ time: Int) -> Int {
    return time / 100 * 60 + time % 100
}

func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    let employees = schedules.count
    var result = 0
    
    for i in 0..<employees {
        let setTime = timeToMin(schedules[i])
        var success = true
        
        for j in 0..<7 {
            if (startday + j) % 7 == 6 || (startday + j) % 7 == 0 {
                continue
            }
            
            if timeToMin(timelogs[i][j]) > setTime + 10 {
                success.toggle()
                break
            }
        }
        
        if success { result += 1 }
    }
    
    return result
}
