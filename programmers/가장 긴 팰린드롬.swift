import Foundation

func solution(_ s: String) -> Int {
    let chars = Array(s)
    
    //길이가 홀수인지 짝수인지 상관없이 하기 위함.
    var transformedChar: [Character] = ["#"]
    
    for char in chars {
        transformedChar.append(char)
        transformedChar.append("#")
    }
    
    let transformedCharLength = transformedChar.count
    var palindromeLengths = [Int](repeating: 0, count: transformedCharLength)   //각 위치에서의 팰린드롬 길이
    var centerIndex = 0 //현재 중심 인덱스
    var rightBoundary = 0   //현재 팰린드롬의 오른쪽 경계
    var maxPalindromeLength = 0 //최대 팰린드롬 길이
    
    for i in 0..<transformedCharLength {    //i = 현재 검사중인 인덱스
        let mirror = 2 * centerIndex - i    //mirror = 현재 인덱스의 대칭 위치
        
        
        //현재 검사중인 위치가 이전에 발견한 팰린드롬의 범위 내에 있는지 확인
        if i < rightBoundary {
            // 우측 경계까지의 거리와 대칭 위치에서의 팰랜드롬의 거리 중 작은 값을 설정
            // 작은 값을 설정함으로써 이미 발견한 팰린드롬 내부의 부분은 대칭성을 이용하여 추가 게산없이 길이를 결정할 수 있음.
            palindromeLengths[i] = min(rightBoundary - i, palindromeLengths[mirror])
        }
        
        //Manacher's 알고리즘
        
        // 현재 위치를 중심으로 확장하기 위해 시작점 설정
        var a = i + (1 + palindromeLengths[i])
        var b = i - (1 + palindromeLengths[i])
        
        // 문자열의 범위 체크 && 양쪽 문자가 같은지 체크
        while (a < transformedCharLength && b >= 0) && (transformedChar[a] == transformedChar[b]) {
            //팰린드롬의 길이를 1증가
            //다음 문자로 이동
            palindromeLengths[i] += 1
            a += 1
            b -= 1
        }
        
        //새로 발견한 팰린드롬이 이전에 알려진 가장 긴 팰린드롬의 오른쪽 경계를 넘어섰는지 확인하여 업데이트
        if i + palindromeLengths[i] > rightBoundary {
            centerIndex = i
            rightBoundary = i + palindromeLengths[i]
        }
        
        //지금까지 발견한 가장 긴 팰린드롬의 길이를 지속적으로 추적하여 초기화 해줌.
        maxPalindromeLength = max(maxPalindromeLength, palindromeLengths[i])
    }
    
    return maxPalindromeLength
}
