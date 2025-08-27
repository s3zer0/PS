import Foundation

func solution(_ data:[[Int]], _ col:Int, _ row_begin:Int, _ row_end:Int) -> Int {
    let sortedData = data.sorted { (row1, row2) in
        if row1[col - 1] == row2[col - 1] {
            return row1[0] > row2[0]
        }
        return row1[col - 1] < row2[col - 1]
    }
    
    var hashValue = 0
    
    for i in row_begin - 1..<row_end {
        var Si = 0
        
        for j in 0..<sortedData[i].count {
            Si += sortedData[i][j] % (i + 1)
        }
        
        hashValue ^= Si
    }
    
    return hashValue
}
