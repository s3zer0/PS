import Foundation

func solution(_ maps:[String]) -> [Int] {
    var result = [Int]()
    var mapArr: [[Character]] = maps.map{ Array($0) }
    let row = maps[0].count, col = maps.count
    
    //for DFS
    let dx = [0, 0, 1, -1], dy = [1, -1, 0, 0]
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: row), count: col)
    
    //dfs
    func dfs(_ x: Int, _ y: Int) -> Int {
        visited[y][x] = true    //방문 처리
        var food = Int(String(mapArr[y][x]))!
        
        for i in 0..<4 {
            let nx = x + dx[i], ny = y + dy[i]
            
            if (0..<row).contains(nx) && (0..<col).contains(ny) && mapArr[ny][nx] != "X" && !visited[ny][nx] {
                food += dfs(nx, ny)
            }
        }
        
        return food
    }
    
    for i in 0..<mapArr.count {
        for j in 0..<mapArr[0].count {
            if !visited[i][j] && mapArr[i][j] != "X" {
                result.append(dfs(j, i))
            }
        }
    }
    
    if result.isEmpty {
        return [-1]
    } else {
        return result.sorted(by: <)
    }
}
