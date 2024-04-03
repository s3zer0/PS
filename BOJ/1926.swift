import Foundation

let nm = readLine()!.split(separator: " ").map{Int(String($0))!}
var visited = Array(repeating: Array(repeating: false, count: nm[1]), count: nm[0])

var paper = Array(repeating: [Int](), count: nm[0])
for i in 0..<nm[0]{
    paper[i] = readLine()!.split(separator: " ").map{Int(String($0))!}
}

let direction = [(1,0),(-1,0),(0,1),(0,-1)]
var draw = 0
var max = 0

for y in 0..<nm[0]{
    for x in 0..<nm[1]{
        if !visited[y][x] && paper[y][x] == 1{
            var count = 1
            visited[y][x] = true
            dfs(x,y, &count)
            if max < count {
                max = count
            }
            draw += 1
        }
    }
}

func dfs(_ x :Int, _ y :Int, _ cnt : inout Int){
    for i in direction {
        let nx = i.1 + x
        let ny = i.0 + y
        if ny < 0 || ny > nm[0] - 1 || nx < 0 || nx > nm[1] - 1 {
            continue
        }
        if !visited[ny][nx] && paper[ny][nx] == 1{
            visited[ny][nx] = true
            cnt += 1
            dfs(nx,ny, &cnt)
        }
    }
}

print(draw)
print(max)
