import Foundation

func solution(_ storage: [String], _ requests: [String]) -> Int {
    let n = storage.count
    let m = storage[0].count
    
    // 2차원 배열로 변환 (공백은 빈 공간을 의미)
    var warehouse: [[Character]] = []
    for row in storage {
        warehouse.append(Array(row))
    }
    
    // 각 요청 처리
    for request in requests {
        if request.count == 1 {
            // 지게차 사용 - 접근 가능한 컨테이너만 제거
            let target = Character(request)
            removeAccessible(&warehouse, target, n, m)
        } else if request.count == 2 {
            // 크레인 사용 - 모든 해당 컨테이너 제거
            let target = request.first!
            removeAll(&warehouse, target, n, m)
        }
    }
    
    // 남은 컨테이너 개수 세기 (공백이 아닌 문자)
    var count = 0
    for i in 0..<n {
        for j in 0..<m {
            if warehouse[i][j] != " " {
                count += 1
            }
        }
    }
    
    return count
}

// BFS로 외부에서 접근 가능한 모든 빈 공간 찾기
func findAccessibleEmptySpaces(_ warehouse: [[Character]], _ n: Int, _ m: Int) -> [[Bool]] {
    var accessible = Array(repeating: Array(repeating: false, count: m), count: n)
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var queue: [(Int, Int)] = []
    
    // 가장자리의 빈 공간들을 시작점으로 추가
    for i in 0..<n {
        for j in 0..<m {
            if warehouse[i][j] == " " {
                // 가장자리에 있는 빈 공간
                if i == 0 || i == n-1 || j == 0 || j == m-1 {
                    queue.append((i, j))
                    visited[i][j] = true
                    accessible[i][j] = true
                }
            }
        }
    }
    
    // BFS로 연결된 모든 빈 공간 찾기
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    
    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        
        for k in 0..<4 {
            let nx = x + dx[k]
            let ny = y + dy[k]
            
            if nx >= 0 && nx < n && ny >= 0 && ny < m && 
               !visited[nx][ny] && warehouse[nx][ny] == " " {
                visited[nx][ny] = true
                accessible[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
    
    return accessible
}

// 접근 가능한 컨테이너만 제거
func removeAccessible(_ warehouse: inout [[Character]], _ target: Character, _ n: Int, _ m: Int) {
    var toRemove: [(Int, Int)] = []
    
    // 먼저 외부에서 접근 가능한 빈 공간 찾기
    let accessibleSpaces = findAccessibleEmptySpaces(warehouse, n, m)
    
    for i in 0..<n {
        for j in 0..<m {
            if warehouse[i][j] == target {
                // 가장자리이거나 외부에서 접근 가능한 빈 공간에 인접한 경우
                var accessible = false
                
                if i == 0 || i == n-1 || j == 0 || j == m-1 {
                    accessible = true
                } else {
                    let dx = [0, 0, 1, -1]
                    let dy = [1, -1, 0, 0]
                    
                    for k in 0..<4 {
                        let nx = i + dx[k]
                        let ny = j + dy[k]
                        
                        if nx >= 0 && nx < n && ny >= 0 && ny < m && 
                           warehouse[nx][ny] == " " && accessibleSpaces[nx][ny] {
                            accessible = true
                            break
                        }
                    }
                }
                
                if accessible {
                    toRemove.append((i, j))
                }
            }
        }
    }
    
    // 접근 가능한 타겟 컨테이너 제거 (공백으로 변경)
    for (i, j) in toRemove {
        warehouse[i][j] = " "
    }
}

// 모든 해당 컨테이너 제거
func removeAll(_ warehouse: inout [[Character]], _ target: Character, _ n: Int, _ m: Int) {
    for i in 0..<n {
        for j in 0..<m {
            if warehouse[i][j] == target {
                warehouse[i][j] = " "
            }
        }
    }
}
