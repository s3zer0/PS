func isInDict(_ message: String, _ dict: inout [String: Int], _ nextIndex: inout Int) -> (Int, Int) {
    var msg = message
    
    // 메시지가 딕셔너리에 존재할 때까지 반복
    while dict[msg] == nil {
        msg.removeLast()
    }
    
    // 딕셔너리의 인덱스 반환
    let index = dict[msg]!
    let length = msg.count
    
    // 새로운 단어 추가 (기존 메시지 + 다음 글자)
    if length < message.count {
        let newWord = String(message.prefix(length + 1))
        dict[newWord] = nextIndex
        nextIndex += 1
    }
    
    return (index, length)
}

func solution(_ msg: String) -> [Int] {
    // 초기 사전 세팅
    var dict: [String: Int] = [:]
    var nextIndex = 1
    for char in "ABCDEFGHIJKLMNOPQRSTUVWXYZ" {
        dict[String(char)] = nextIndex
        nextIndex += 1
    }
    
    var result: [Int] = []
    var remainingMsg = msg
    
    // 메시지 처리
    while !remainingMsg.isEmpty {
        let (index, length) = isInDict(remainingMsg, &dict, &nextIndex)
        result.append(index)
        remainingMsg.removeFirst(length)
    }
    
    return result
}
