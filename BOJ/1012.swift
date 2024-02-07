import Foundation

func bfs(_ r: Int, _ c: Int) {  //bfs
    let dx = [1,-1,0,0] //왼 오
    let dy = [0,0,1,-1] //위 아래
    
    var queue = [(r,c)]
    var idx = 0
    var cnt = 1
    cabbageField[r][c] = false
    
    while queue.count > idx {
        let (x,y) = queue[idx]
        idx += 1
        
        for i in 0..<4 {    //4방향 확인
            let (nx,ny) = (x+dx[i],y+dy[i])
            if (0..<n).contains(nx) && (0..<m).contains(ny) && cabbageField[nx][ny] == true { //범위를 벗어나지 않도록 체크
                cabbageField[nx][ny] = false
                cnt += 1
                queue.append((nx,ny))
            }
        }
    }
}

let testCase = Int(readLine()!)!
var m = 0, n = 0, k = 0
var cabbageField: [[Bool]]

for _ in 0..<testCase {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    m = input[0]; n = input[1]; k = input[2]    //가로, 세로, 배추의 개수
    cabbageField = Array(repeating: Array(repeating: false, count: m), count: n)
    
    for _ in 0..<k {
        let location = readLine()!.split(separator: " ").map{Int(String($0))!}  //x, y
        cabbageField[location[1]][location[0]] = true
    }
    
    var result = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if cabbageField[i][j] == true {
                bfs(i, j)
                result += 1
            }
        }
    }
    
    print(result)
}
