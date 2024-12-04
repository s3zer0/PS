import Foundation

func f(_ n: Int, _ k: Int64) -> Int64 {
    if n == 1 {
        return k <= 2 ? k : k - 1
    }

    let div = Int64(pow(5.0, Double(n - 1)))
    let mul = Int64(pow(4.0, Double(n - 1)))
    var loc = k / div

    if k % div == 0 {
        loc -= 1
    }

    if loc < 2 {
        return mul * loc + f(n - 1, k - loc * div)
    } else if loc == 2 {
        return mul * loc
    } else {
        return mul * (loc - 1) + f(n - 1, k - loc * div)
    }
}

func solution(_ n: Int, _ l: Int64, _ r: Int64) -> Int64 {
    return f(n, r) - f(n, l - 1)
}
