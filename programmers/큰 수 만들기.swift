func solution(_ number: String, _ k: Int) -> String {
    var stack: [Character] = []
    var remainingRemovals = k
    
    for digit in number {
        // 스택의 마지막 숫자가 현재 숫자보다 작고, 제거 가능한 횟수가 남아있을 때
        while !stack.isEmpty && remainingRemovals > 0 && stack.last! < digit {
            stack.removeLast()
            remainingRemovals -= 1
        }
        // 현재 숫자를 스택에 추가
        stack.append(digit)
    }
    
    // 아직 제거하지 못한 숫자가 남아 있다면 뒤에서 제거
    if remainingRemovals > 0 {
        stack = Array(stack.dropLast(remainingRemovals))
    }
    
    // 스택을 문자열로 변환하여 반환
    return String(stack)
}
