func solution(_ board: [[Int]]) -> Int {
    guard !board.isEmpty else { return 0 }
    
    let rows = board.count
    let cols = board[0].count
    
    var maxSide = 0
    var dp = Array(repeating: Array(repeating: 0, count: cols + 1), count: rows + 1)
    
    for i in 1...rows {
        for j in 1...cols {
            if board[i - 1][j - 1] == 1 {
                dp[i][j] = min(dp[i - 1][j], dp[i][j - 1], dp[i - 1][j - 1]) + 1
                maxSide = max(maxSide, dp[i][j])
            }
        }
    }
    
    return maxSide * maxSide
}
