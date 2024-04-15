let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (R, C) = (input[0], input[1])

var lake = [[String]]()
var (sx, sy) = (-1, -1)
var (ex, ey) = (-1, -1)
var swanQueue: [(Int, Int)] = []
var waterQueue: [(Int, Int)] = []

for i in 0..<R {
    lake.append(readLine()!.map{ String($0) })
    for j in 0..<C {
        if lake[i][j] == "L" {
            if sx == -1 && sy == -1 {
                sx = i; sy = j
            } else {
                ex = i; ey = j
            }
            lake[i][j] = "."
            waterQueue.append((i, j))
        } else if lake[i][j] == "." {
            waterQueue.append((i, j))
        }
    }
}

var visit = Array(repeating: Array(repeating: false, count: C), count: R)
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

func meltIce() {
    var nextWaterQueue: [(Int, Int)] = []
    var front = 0
    while front < waterQueue.count {
        let (x, y) = waterQueue[front]
        front += 1
        
        for i in 0...3 {
            let nX = x + dx[i]
            let nY = y + dy[i]

            if nX < 0 || nY < 0 || nX >= R || nY >= C {
                continue
            }
            if lake[nX][nY] == "X" {
                lake[nX][nY] = "."
                nextWaterQueue.append((nX, nY))
            }
        }
    }
    
    waterQueue = nextWaterQueue
}

func moveSwan() -> Bool {
    var nextSwanQueue: [(Int, Int)] = []
    var front = 0

    while front < swanQueue.count {
        let (x, y) = swanQueue[front]
        front += 1
        
        if x == ex && y == ey {
            return true
        }
        
        for i in 0...3 {
            let nX = x + dx[i]
            let nY = y + dy[i]

            if nX < 0 || nY < 0 || nX >= R || nY >= C || visit[nX][nY] {
                continue
            }
            visit[nX][nY].toggle()
            if lake[nX][nY] == "X" {
                nextSwanQueue.append((nX, nY))
                continue
            }
            swanQueue.append((nX, nY))
        }
    }
    swanQueue = nextSwanQueue
    
    return false
}

swanQueue = [(sx, sy)]
visit[sx][sy] = true

var answer = 0
while true {
    if moveSwan() { break }
    meltIce()
    answer += 1
}

print(answer)
