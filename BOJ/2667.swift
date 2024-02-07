import Foundation

func checkComplex(_ r: Int, _ c: Int) -> Int {  //bfs
    let dx = [1,-1,0,0] //왼 오
    let dy = [0,0,1,-1] //위 아래
    
    var queue = [(r,c)]
    var idx = 0
    var cnt = 1
    graph[r][c] = 0
    
    while queue.count > idx {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {    //4방향 확인
            let (nx,ny) = (x+dx[i],y+dy[i])
            if (0..<mapSize).contains(nx) && (0..<mapSize).contains(ny) && graph[nx][ny] == 1 { //범위를 벗어나지 않도록 체크
                graph[nx][ny] = 0   //이미 지나온 곳은 0으로 변경하여 체크
                cnt += 1
                queue.append((nx,ny))
            }
        }
    }
    return cnt
}


let mapSize = Int(readLine()!)!
var graph = [[Int]]()
var complex = [Int]()   //단지

for _ in 0..<mapSize {
    graph.append(Array(readLine()!).map{Int(String($0))!})
}

for i in 0..<mapSize {
    for j in 0..<mapSize {
        if graph[i][j] == 1 {
            complex.append(checkComplex(i, j))
        }
    }
}

print(complex.count)
for cnt in complex.sorted(by: <) {
    print(cnt)
}
