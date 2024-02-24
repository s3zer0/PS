import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let l = input[0], c = input[1]
var charList = readLine()!.split(separator: " ").map{ String($0) }.sorted(by: <)

var visited = Array(repeating: false, count: c)
var depth = 0
let aeiou = ["a", "e", "i", "o", "u"]
let consonant = ["b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z"]
var result: [String] = []

func dfs(depth: Int, start: Int) {
    if depth == l {
        var containAeiou = false
        var consonantCnt = 0
        
        for v in aeiou {
            if result.contains(v) {
                containAeiou = true
            }
        }
        
        for i in result {
            if consonant.contains(i) {
                consonantCnt += 1
            }
        }
        
        if consonantCnt >= 2 && containAeiou == true {
            print(result.joined(separator: ""))
        }
        return
    }
    
    for i in start..<c{
        if !visited[i] {
            visited[i] = true
            result.append(charList[i])
            dfs(depth: depth + 1, start: i)
            visited[i] = false
            result.removeLast()
        }
    }
}

dfs(depth: depth, start: 0)
