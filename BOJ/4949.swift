import Foundation

while true {
    let str = readLine()!
    
    if str == "." {
        break
    } else {
        var stack = [Character]()
        var isBalanced = true
        let arr = str.split(separator: " ").map{String($0)}
        
        for word in arr {
            for c in word {
                if ["(", "["].contains(c) {
                    stack.append(c)
                }
                
                if [")", "]"].contains(c) {
                    if stack.isEmpty {
                        isBalanced.toggle()
                        break
                    }
                    
                    if c == ")" && stack.last == "(" {
                        stack.removeLast()
                    } else if c == "]" && stack.last == "[" {
                        stack.removeLast()
                    } else {
                        isBalanced.toggle()
                        break
                    }
                }
            }
            
            if !isBalanced { break }
        }
        
        if isBalanced && stack.isEmpty {
            print("yes")
        } else {
            print("no")
        }
    }
}
