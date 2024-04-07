var alpha = Array(repeating: 0, count: 26)

let str1 = Array(readLine()!)
for c in str1 {
    alpha[Int(Unicode.Scalar(String(c))!.value) - 97] += 1
}

let str2 = Array(readLine()!)
for c in str2 {
    alpha[Int(Unicode.Scalar(String(c))!.value) - 97] -= 1
}

var cnt = 0
for i in alpha.indices {
    cnt += abs(alpha[i])
}
print(cnt)
