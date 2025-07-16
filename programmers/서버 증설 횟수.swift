import Foundation

func solution(_ players:[Int], _ m:Int, _ k:Int) -> Int {
    var maxPlayer = m
    var serverUpgradeTimes = [(Int, Int)]()
    var result = 0
    
    for i in 0..<players.count {
        for (t, c) in serverUpgradeTimes {
            if i - t >= k {
                maxPlayer -= c * m
                if let index = serverUpgradeTimes.firstIndex(where: { $0.0 == t }) {
                    serverUpgradeTimes.remove(at: index)
                }
            }
        }
        
        if players[i] >= maxPlayer {
            let serverCount = (players[i] - maxPlayer) / m + 1
            maxPlayer += m * serverCount
            serverUpgradeTimes.append((i, serverCount))
            result += serverCount
        }
    }
    
    return result
}
