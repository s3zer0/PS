import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    var visited = [Bool](repeating: false, count: dungeons.count)
    
    func dfs(_ count: Int, fatigue: Int){
        if result < count { result = count }
        
        for i in 0..<dungeons.count{
            if !visited[i] && dungeons[i][0] <= fatigue {
                visited[i] = true
                dfs(count + 1, fatigue: fatigue - dungeons[i][1])
                visited[i] = false
            }
        }
    }
    
    dfs(0, fatigue: k)
    
    return result
}
