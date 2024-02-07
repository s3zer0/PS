import Foundation

func DFS(_ node: Int) {
    visited[node] = true
    print(node, terminator: " ")
    
    for nextNode in graph[node] {
        if !visited[nextNode] {
            DFS(nextNode)
        }
    }
}

func BFS(_ node: Int) {
    var queue = [node]
    var index = 0
    visited[node] = true
    
    while queue.count > index {
        let currentNode = queue[index]
        print(currentNode, terminator: " ")
        
        for nextNode in graph[currentNode] {
            if !visited[nextNode] {
                visited[nextNode] = true
                queue.append(nextNode)
            }
        }
        index += 1
    }
}


let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1], v = input[2]

var graph:[[Int]] = Array(repeating: [], count: n+1)
var visited:[Bool] = Array(repeating: false, count: n+1)

for _ in 0..<m {
    let node = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    graph[node[0]].append(node[1])
    graph[node[1]].append(node[0])
}

graph = graph.map{ $0.sorted() }

DFS(v)

visited = Array(repeating: false, count: n+1)
print()
BFS(v)
