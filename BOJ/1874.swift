let n = Int(readLine()!)!

var stack = [Int]()
var cmd = [String]()
var lastIdx = 1

func makeSequence(_ x: Int) -> Bool {
    while lastIdx <= x {
        stack.append(lastIdx)
        cmd.append("+")
        lastIdx += 1
    }
    
    if stack.last! == x {
        let popped = stack.popLast()!
        cmd.append("-")
    } else {
        return false
    }
    
    return true
}

var isPossible = true

for _ in 0..<n {
    let input = Int(readLine()!)!
    
    if !makeSequence(input) {
        isPossible.toggle()
        break
    }
}

if isPossible {
    cmd.forEach {
        print($0)
    }
} else {
    print("NO")
}
