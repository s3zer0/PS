import Foundation

func solution(_ plans:[[String]]) -> [String] {
    let plans = plans.sorted{ (first, second) in
        return first[1] < second[1]
    }
    
    var result = [String]()
    var endTime = [Int]()
    var delayPlans = [(String, Int)]()
    
    for i in 0..<plans.count {
        var clock = plans[i][1].split(separator: ":").map{Int($0)!}
        
        if endTime.isEmpty != true {
            if endTime[0] < clock[0] || (endTime[0] == clock[0] && endTime[1] <= clock[1]) {
                result.append(plans[i-1][0])
                var leftTime = (clock[0] - endTime[0]) * 60 + (clock[1] - endTime[1])
                
                if leftTime > 0 && delayPlans.isEmpty != true {
                    for delayPlan in delayPlans.reversed() {
                        if leftTime - delayPlan.1 >= 0 {
                            leftTime -= delayPlan.1
                            result.append(delayPlan.0)
                            delayPlans.removeLast()
                        }
                        else {
                            let subject = delayPlan.0, time = delayPlan.1 - leftTime
                            delayPlans.removeLast()
                            delayPlans.append((subject, time))
                            leftTime = 0
                        }
                        
                        if leftTime == 0 {break}
                    }
                }
            }
            else {
                var leftTime = (endTime[0] - clock[0]) * 60 + (endTime[1] - clock[1])
                delayPlans.append((plans[i-1][0], leftTime))
            }
        }
        
        
        if i == plans.count - 1 {
            result.append(plans[i][0])
        }
        else {
            clock[1] += Int(plans[i][2])!
            while clock[1] >= 60 {
                clock[0] += 1
                clock[1] -= 60
            }
            endTime = clock
        }
    }
    
    if delayPlans.isEmpty != true {
        for (key, value) in delayPlans.reversed() {
            result.append(key)
        }
    }
    
    return result
}
