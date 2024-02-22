import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], s = input[1]
let nums = readLine()!.split(separator: " ").map{Int(String($0))!}

var count = 0
var sum = 0

func dfs(length: Int, now: Int) {
    if sum == s && length > 0 {
        count += 1
    }
  
    for i in now..<n {
        sum += nums[i]
        dfs(length: length + 1, now: i + 1)
        sum -= nums[i]
    }
}

dfs(length: 0, now: 0)
print(count)
