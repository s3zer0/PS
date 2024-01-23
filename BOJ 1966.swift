import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var queue = readLine()!.split(separator: " ").map{Int(String($0))!}
    
    var m = input[1]
    
    while !queue.isEmpty {
        let temp = queue[0]
        
        queue.removeFirst()
        
        for i in queue {
            if i > temp {
                queue.append(temp)
                if m == 0 {
                    m += queue.count
                }
                break
            }
        }
        
        if m == 0 {
            print(input[0] - queue.count)
            break
        } else {
            m -= 1
        }
    }
}
