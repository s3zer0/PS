import Foundation

func isPrime(_ n: Int) -> Bool {
    if n < 4 {
        if n == 1 { return false }
        else { return true }
    }
    
    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 {
            return false
        }
    }
    return true
}

func isPalindrome(_ str: String) -> Bool {
    let arr = Array(str)
    
    for i in 0..<(arr.count / 2) {
        if arr[i] != arr[arr.count - i - 1] {
            return false
        }
    }
    
    return true
}


let n = Int(readLine()!)!

for i in n... {
    if isPrime(i) {
        if isPalindrome(String(i)) {
            print(i)
            break
        }
    }
}
