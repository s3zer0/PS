import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = priorities
    var location = location
    var result = 0
    
    while queue.count != 0 {
        let now_process = queue[0]
        let top_priority = queue.max()!
        queue.removeFirst()
        location -= 1

        if now_process != top_priority {
            queue.append(now_process)
            if location < 0 {
                location = queue.count - 1
            }
        }
        else {
            result += 1
            if location < 0 {
                break
            }
        }
    }
    
    return result
}
