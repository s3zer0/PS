import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    if (b == 0) {
        return a
    }
    
    return gcd(b, a % b)
}

func isDividable(_ arr: [Int], _ div: Int) -> Bool {
    if div == 1 { return true }
    
    for int in arr {
        if int % div == 0 { return true }
    }
    
    return false
}


func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    var gcdArr = [arrayA[0], arrayB[0]]
    
    for i in 0..<arrayA.count {
        gcdArr[0] = gcd(gcdArr[0], arrayA[i])
        gcdArr[1] = gcd(gcdArr[1], arrayB[i])
    }
    
    var maxDiv = 0
    if !isDividable(arrayA, gcdArr[1]) && gcdArr[1] > maxDiv { maxDiv = gcdArr[1] }
    if !isDividable(arrayB, gcdArr[0]) && gcdArr[0] > maxDiv { maxDiv = gcdArr[0] }
    
    return maxDiv
}
