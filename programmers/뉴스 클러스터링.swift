func sliceString(_ str: String) -> [String] {
    let arr: [Character] = Array(str)
    var ret = [String]()
    
    for i in 0..<arr.count - 1 {
        if arr[i].isLetter && arr[i + 1].isLetter {
            ret.append(arr[i].lowercased() + arr[i + 1].lowercased())
        }
    }
    
    return ret
}

func solution(_ str1:String, _ str2:String) -> Int {
    var arr1: [String] = sliceString(str1)
    var arr2: [String] = sliceString(str2)
    
    var allCnt = arr1.count + arr2.count
    var intersectionCnt = 0
    
    for i in arr1.indices{
        for j in arr2.indices{
            if arr1[i] == arr2[j]{
                intersectionCnt += 1
                arr2.remove(at: j)
                break
            }
        }
    }
    
    let unionCnt = allCnt - intersectionCnt
    
    if unionCnt == 0{
        return 65536
    } else if intersectionCnt == 0{
        return 0
    } else{
        return Int(Double(intersectionCnt) / Double(unionCnt) * 65536)
    }
}
