import Foundation

func dfs(_ node: Int) {
    visited[node] = true
    
    for nextNode in graph[node] {
        if !visited[nextNode] {
            visited[nextNode] = true
            dfs(nextNode)
        }
    }
}

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]  //정점 개수 : n, 간선의 개수 : m
var graph:[[Int]] = Array(repeating: [], count: n+1)

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = uv[0], v = uv[1]
    graph[u].append(v)
    graph[v].append(u)
}

var visited = Array(repeating: false, count: n + 1)
var answer = 0
for i in 1...n {
    if !visited[i] {    //dfs를 한 이후에도 false가 존재한다면, 다른 간선이므로 answer에 1을 더해줘서 해결함.
        answer += 1
        dfs(i)
    }
}

print(answer)
