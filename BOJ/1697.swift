let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
var n = nk[0], k = nk[1]

var visited = Array(repeating: false, count: 100001)
 
var needToVisit = [(n, 0)]   //Queue
var index = 0
visited[n] = true

while needToVisit.count > index {
    let point = needToVisit[index].0
    let second = needToVisit[index].1
    
    if point == k {
        print(second)
        break
    }
    
    for i in [1, -1, point] {
        let nextVisit = point + i
        if 0...100_000 ~= nextVisit && !visited[nextVisit] {
            visited[nextVisit] = true
            needToVisit.append((nextVisit, second + 1))
        }
    }
    
    index += 1
}
