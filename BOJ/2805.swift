import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let target_height = input[1]
let tree_heights = readLine()!.split(separator: " ").map{Int(String($0))!}
let max_height = tree_heights.max()!

var start = 0, end = max_height

while start <= end {
    var sum = 0
    let mid = (start + end) / 2
    
    for tree_height in tree_heights {
        if tree_height - mid < 0 { continue }
        sum += (tree_height - mid)
    }
    
    if sum < target_height {
        end = mid - 1
    }
    else {
        start = mid + 1
    }
}
print(start - 1)
