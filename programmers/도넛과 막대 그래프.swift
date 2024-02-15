import Foundation

func findCenterVertex(_ graph: [[Int]], _ inEdge: [[Int]], _ outEdge: [[Int]]) -> Int { //inEdge : 들어오는 edge, outEdge : 나가는 edge
    for i in 0..<graph.count {
        if inEdge[i].isEmpty && outEdge[i].count >= 2 {
            return i
        }
    }
    return -1
}

func countGraph(_ centerVertex: Int,_ graph: [[Int]], _ inEdge: [[Int]], _ outEdge: [[Int]]) -> [Int] {
    var count = [0, 0, 0]
    var visited = Set<Int>()
    
    for start in graph[centerVertex] {
        visited.insert(start)
        var now = start
        
        while true {
            if outEdge[now].isEmpty {   //막대모양
                count[1] += 1
                break
            } else if outEdge[now].count == 2 {   //8자 모양의 중심점
                count[2] += 1
                break
            }
            now = graph[now][0]
            
            if visited.contains(now) && outEdge[now].count == 1 {   //이미 방문한 노드로 돌아오면서 나가는게 하나뿐이면 도넛모양임.
                count[0] += 1
                break
            }
            
            visited.insert(now)
        }
    }
    
    return count
}


func solution(_ edges:[[Int]]) -> [Int] {
    var result = [0, 0, 0, 0]   //생성한 정점, 도넛, 막대, 8자
    var graph: [[Int]] = Array(repeating: [], count: 1000001)
    var inEdge: [[Int]] = Array(repeating: [], count: 1000001)  //들어오는 edge
    var outEdge: [[Int]] = Array(repeating: [], count: 1000001) //나가는 edge
    
    for edge in edges {
        graph[edge[0]].append(edge[1])
        inEdge[edge[1]].append(edge[0])
        outEdge[edge[0]].append(edge[1])
    }
    
    result[0] = findCenterVertex(graph, inEdge, outEdge)
    
    let cnt = countGraph(result[0], graph, inEdge, outEdge)
    result[1] = cnt[0]; result[2] = cnt[1]; result[3] = cnt[2]
    
    return result
}
