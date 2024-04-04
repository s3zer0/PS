import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}    //y, x
var maze = [[String]]()

for _ in 0..<nm[0] {
    maze.append(readLine()!.map{String($0)})
}

let dir = [(-1, 0), (1, 0), (0, -1), (0, 1)]

var needToVisit = [(Int,Int)]()
var distance : [[Int]] = Array(repeating: Array(repeating: 0, count:nm[1]), count:nm[0])
distance[0][0] = 1

func bfs(_ r:Int, _ c:Int) {
    needToVisit.append((r,c))
    maze[r][c] = "0"
    
    while !needToVisit.isEmpty {
        let node = needToVisit.removeFirst()
        
        for i in dir {
            let (nx,ny) = (node.0 + i.0, node.1 + i.1)
            
            if (0..<nm[0]).contains(nx) && (0..<nm[1]).contains(ny) && maze[nx][ny] == "1" {
                maze[nx][ny] = "0"
                needToVisit.append((nx,ny))
                distance[nx][ny] = distance[node.0][node.1] + 1
            }
        }
    }
}

bfs(0, 0)
print(distance[nm[0]-1][nm[1]-1])
