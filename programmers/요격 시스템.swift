import Foundation

func solution(_ targets:[[Int]]) -> Int {
    let targets = targets.sorted { (first, second) in
        return first[0] < second[0]
    }
    
    var missile = 0
    var overLap = [0, 0]
    
    for target in targets {
        if overLap[1] <= target[0] {
            missile += 1
            overLap = target
        }
        else {
            overLap = [max(overLap[0], target[0]), min(overLap[1], target[1])]
        }
    }
    
    return missile
}
