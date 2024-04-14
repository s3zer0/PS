import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let row = input[0], col = input[1]

var queue = [(Int, Int)](), l = 0   //jihun's queue
var fireQueue = [(Int,Int)](), f = 0   //fire queue

var maze = [[String]]()

var time = 0
var success = false

let dir = [(0,1), (0,-1), (1,0), (-1,0)]
var moved = Array(repeating: Array(repeating: false, count: col), count: row)

for i in 0..<row {
    var input = readLine()!.map{String($0)}
    
    for j in 0..<col {
        if input[j] == "J" {
            input[j] = "."
            moved[i][j] = true
            queue.append((i,j))
        } else if input[j] == "F" {
            fireQueue.append((i,j))
        }
    }
    
    maze.append(input)
}

func moveFire() {
    let fireLeft = f
    f = fireQueue.count
    for i in fireLeft..<fireQueue.count {
        let f = fireQueue[i]
        for k in 0..<4 {
            let n = (f.0+dir[k].0, f.1+dir[k].1)
            if (n.0>=row||n.1>=col||n.0<0||n.1<0){continue}
            if maze[n.0][n.1] == "." {
                maze[n.0][n.1] = "F"
                fireQueue.append((n))
            }
        }
    }
}

func moveJihun() {
    let left = l
    l = queue.count
    for i in left..<queue.count {
        let f = queue[i]
        if f.0 == 0 || f.0 == row-1 || f.1 == 0 || f.1 == col-1 { success = true }
        for k in 0..<4 {
            let n = (f.0+dir[k].0, f.1+dir[k].1)
            if (n.0>=row||n.1>=col||n.0<0||n.1<0){continue}
            if maze[n.0][n.1] == "." && !moved[n.0][n.1] {
                moved[n.0][n.1] = true
                queue.append((n))
            }
        }
    }
}

while l<queue.count && !success{
    time += 1
    moveFire()
    moveJihun()
}

print(success ? time : "IMPOSSIBLE")
