import Foundation

var a = readLine()!.split(separator: " ").map{Int(String($0))!}
var b = readLine()!.split(separator: " ").map{Int(String($0))!}

var score = [0, 0]
var lastwin = ""

for i in 0..<10 {
    if a[i] > b[i] {
        score[0] += 3
        lastwin = "A"
    } else if a[i] < b[i] {
        score[1] += 3
        lastwin = "B"
    } else {
        score[0] += 1
        score[1] += 1
    }
}

print(score[0], score[1])

if lastwin == "" {
    print("D")
} else {
    if score[0] == score[1] {
        print(lastwin)
    } else {
        if score[0] > score[1] {
            print("A")
        } else {
            print("B")
        }
    }
}
