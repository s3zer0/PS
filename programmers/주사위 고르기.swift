import Foundation

// n개의 정수 배열 중에서 r개를 고르는 모든 조합을 구하는 함수 [1]
func combination(_ array: [Int], _ r: Int) -> [[Int]] {
    var result = [[Int]]()
    if array.count < r { return result }
    
    func cycle(_ index: Int, _ now: [Int]) {
        if now.count == r {
            result.append(now)
            return
        }
        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }
    
    cycle(0, [])
    return result
}

// 지정된 주사위들(diceIndices)을 모두 굴려 나올 수 있는 "합"의 분포를 구합니다.
// 딕셔너리 key: 가능한 합, value: 그 합이 나오는 경우의 수 [2]
func getSumDistribution(dice: [[Int]], diceIndices: [Int]) -> [Int: Int] {
    // 시작은 합 0이 1가지 경우
    var distribution = [0: 1]
    
    // 각 주사위를 순회하며 가능한 합을 누적
    for idx in diceIndices {
        var newDist = [Int: Int]()
        for (currentSum, count) in distribution {
            // 해당 주사위의 각 면을 더해 새로운 합을 기록
            for faceValue in dice[idx] {
                let newSum = currentSum + faceValue
                newDist[newSum, default: 0] += count
            }
        }
        distribution = newDist
    }
    return distribution
}

// a의 분포 vs b의 분포에서 a가 이기는 횟수를 구합니다.
// (무승부, b가 이기는 횟수도 구할 수 있으나 여기서는 승리 횟수만 있으면 충분)
func countWins(aDist: [Int: Int], bDist: [Int: Int]) -> Int {
    // aDist, bDist의 키(합)을 정렬하여 prefix sum으로 비교
    let sortedA = aDist.sorted { $0.key < $1.key }
    let sortedB = bDist.sorted { $0.key < $1.key }
    
    // b의 누적 개수(prefix sum) 구하기
    var prefixB = [Int](repeating: 0, count: sortedB.count)
    prefixB[0] = sortedB[0].value
    for i in 1..<sortedB.count {
        prefixB[i] = prefixB[i - 1] + sortedB[i].value
    }
    
    var totalWins = 0
    var idxB = 0
    
    // a의 각 (합, 개수)에 대해, b의 합이 a의 합보다 작은 경우를 모두 센다
    for (aSum, aCount) in sortedA {
        while idxB < sortedB.count && sortedB[idxB].key < aSum {
            idxB += 1
        }
        if idxB > 0 {
            totalWins += aCount * prefixB[idxB - 1]
        }
    }
    return totalWins
}

func solution(_ dice: [[Int]]) -> [Int] {
    let n = dice.count
    let allIndices = Array(0..<n)
    let allCombinations = combination(allIndices, n/2)  // n개 중 n/2를 고르는 모든 조합
    
    // 캐싱: 이미 구한 분포를 저장해놓고 재활용
    var distCache = [String: [Int: Int]]()
    func getDistCached(for indices: [Int]) -> [Int: Int] {
        // indices를 정렬한 뒤 문자열로 만들어 캐싱 key로 사용
        let key = indices.sorted().map(String.init).joined(separator: ",")
        if let cache = distCache[key] {
            return cache
        }
        let dist = getSumDistribution(dice: dice, diceIndices: indices)
        distCache[key] = dist
        return dist
    }
    
    var bestCombination = [Int]()
    var maxWinningCount = -1
    
    // 대칭되는 조합(한쪽이 i번째 조합이면, 나머지는 그 보수)만 비교하면 되므로
    // 전체 조합 수를 2로 나눈 범위까지만 순회
    for i in 0..<(allCombinations.count / 2) {
        let aIndices = allCombinations[i]
        let bIndices = allCombinations[allCombinations.count - 1 - i]
        
        let aDist = getDistCached(for: aIndices)
        let bDist = getDistCached(for: bIndices)
        let aWins = countWins(aDist: aDist, bDist: bDist)
        
        // b 쪽도 별도로 승리 횟수를 구해야 하므로
        let bWins = countWins(aDist: bDist, bDist: aDist)
        
        // A가 aIndices 선택 시 승리 횟수가 최고치 갱신이면 갱신
        if aWins > maxWinningCount {
            maxWinningCount = aWins
            // 1-based 인덱스 반환
            bestCombination = aIndices.map { $0 + 1 }
        }
        // A가 bIndices 선택 시 승리 횟수가 최고치 갱신이면 갱신
        if bWins > maxWinningCount {
            maxWinningCount = bWins
            bestCombination = bIndices.map { $0 + 1 }
        }
    }
    
    // 오름차순 정렬된 조합을 반환
    return bestCombination.sorted()
}
