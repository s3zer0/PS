import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let m = input[0], n = input[1]  //가로, 세로

var box = [[Int]]()
var needToVisit = [(Int, Int)]() //(y, x)
let direction = [(1,0),(-1,0),(0,1),(0,-1)]

for i in 0..<n {
    box.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    
    for j in box[i].indices {
        if box[i][j] == 1 {
            needToVisit.append((i, j))
        }
    }
}

var index = 0
var maxDate = 0

while needToVisit.count > index {
    let y = needToVisit[index].0, x = needToVisit[index].1
    
    for i in 0..<4 {
        let ny = y + direction[i].0, nx = x + direction[i].1
        
        if (0..<m).contains(nx) && (0..<n).contains(ny) && box[ny][nx] == 0 {
            maxDate = box[y][x]
            box[ny][nx] = box[y][x] + 1
            needToVisit.append((ny, nx))
        }
    }
    index += 1
}

var isCooked = true

for i in box.indices {
    if box[i].contains(0) {
        isCooked = false
        break
    }
}

print(isCooked ? maxDate : -1)
