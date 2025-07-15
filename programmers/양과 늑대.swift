import Foundation

func solution(_ info: [Int], _ edges: [[Int]]) -> Int {
    // 그래프 구성 (인접 리스트)
    var graph = Array(repeating: [Int](), count: info.count)
    for edge in edges {
        let parent = edge[0]
        let child = edge[1]
        graph[parent].append(child)
    }
    
    var maxSheep = 0
    
    func dfs(_ current: Int, _ sheep: Int, _ wolf: Int, _ nextNodes: Set<Int>) {
        var sheepCount = sheep
        var wolfCount = wolf
        
        // 현재 노드의 동물 수집
        if info[current] == 0 {  // 양
            sheepCount += 1
        } else {  // 늑대
            wolfCount += 1
        }
        
        // 늑대가 양보다 많거나 같으면 종료
        if wolfCount >= sheepCount {
            return
        }
        
        // 최대 양의 수 갱신
        maxSheep = max(maxSheep, sheepCount)
        
        // 다음 방문 가능한 노드들 업데이트
        // 현재 노드를 제외하고, 현재 노드의 자식들을 추가
        var newNextNodes = nextNodes
        newNextNodes.remove(current)
        for child in graph[current] {
            newNextNodes.insert(child)
        }
        
        // 다음 방문 가능한 노드들을 모두 시도
        for nextNode in newNextNodes {
            dfs(nextNode, sheepCount, wolfCount, newNextNodes)
        }
    }
    
    // 루트 노드(0)부터 시작
    dfs(0, 0, 0, [0])
    
    return maxSheep
}
