import Foundation

func solution(_ maps:[String]) -> Int {
    let dx = [0, 0, -1, 1]
    let dy = [1, -1, 0, 0]
    var start = (0, 0), lever = (0, 0)
    var mapArr = [[Character]]()
    
    for (i, low) in maps.enumerated() {
        if let j = Array(low).firstIndex(of: "S") { start = (j, i) }
        if let j = Array(low).firstIndex(of: "L") { lever = (j, i) }
        mapArr.append(Array(low))
    }
    
    func bfs(start: (Int, Int), end: String) -> Int? {
        var distance = Array(repeating: Array(repeating: -1, count: maps[0].count), count: maps.count)
        var queue: [(Int, Int)] = []
        distance[start.1][start.0] = 0
        queue.append(start)
        
        while !queue.isEmpty {
            let (qx, qy) = queue.removeFirst()
            for i in 0..<4 {
                let nx = qx + dx[i]
                let ny = qy + dy[i]
                
                if 0..<maps[0].count ~= nx && 0..<maps.count ~= ny && mapArr[ny][nx] != "X" && distance[ny][nx] == -1 {
                    if mapArr[ny][nx] == Character(end) {
                        return distance[qy][qx] + 1
                    }
                    distance[ny][nx] = distance[qy][qx] + 1
                    queue.append((nx, ny))
                }
            }
        }
        return nil
    }
    
    guard let time1 = bfs(start: start, end: "L") else { return -1 }
    guard let time2 = bfs(start: lever, end: "E") else { return -1 }
    
    return time1 + time2
}
