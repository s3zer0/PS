import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var result = [Int]()
    var left_days = [Int]()
    
    for i in 0..<progresses.count {
        left_days.append(Int(ceil(Double(100 - progresses[i]) / Double(speeds[i]))))
    }
    
    var max_day = left_days[0], cnt = 0
    for left_day in left_days {
        if max_day >= left_day {
            cnt += 1
        }
        else {
            max_day = left_day
            result.append(cnt)
            cnt = 1
        }
    }
    
    if cnt != 0 {
        result.append(cnt)
    }
    
    return result
}
