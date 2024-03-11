import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    var number = String(n)
    if k != 10 {
        number = String(n, radix: k)
    }
    
    var arr = [Int]()
    var temp: String = ""
    
    for i in number {
        if i != "0" {
            temp += String(i)
        } else {
            if temp != ""  && temp != "1" {
                arr.append(Int(temp)!)
            }
            temp = ""
        }
    }
    
    if temp != "" && temp != "1" {
        arr.append(Int(temp)!)
    }
    
    func isPrime(_ n: Int)-> Bool {
        if n != 2 && n != 3 {
            for i in 2...Int(sqrt(Double(n))) {
                if n % i == 0 { return false }
            }
        }
        
        return true
    }
    
    var answer = 0
    
    if !arr.isEmpty {
        for i in arr {
            if isPrime(i) {
                answer += 1
            }
        }
    }
    
    return answer
}
