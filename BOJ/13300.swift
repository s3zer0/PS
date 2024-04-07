let nk = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = nk[0], roomMaxMember = nk[1]

var man = Array(repeating: 0, count: 7), woman = Array(repeating: 0, count: 7)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let s = input[0], grade = input[1]
    
    if s == 0 {
        woman[grade] += 1
    } else {
        man[grade] += 1
    }
}

var roomCnt = 0

for i in 1...6 {
    roomCnt += man[i] / roomMaxMember
    roomCnt += woman[i] / roomMaxMember
    
    if man[i] % roomMaxMember != 0 {
        roomCnt += 1
    }
    
    if woman[i] % roomMaxMember != 0 {
        roomCnt += 1
    }
}

print(roomCnt)
