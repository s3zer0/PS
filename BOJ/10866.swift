import Foundation

var deque = [Int]()
let N = Int(readLine()!)!

func empty(_ arr: [Int]) -> Bool {
    if arr.isEmpty {
        print(-1)
        return true
    }
    
    return false
}

func pop(_ index: Int) {
    print(deque[index])
    deque.remove(at: index)
}

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{String($0)}
    
    switch input[0] {
        
    case "push_front":  //push_front X: 정수 X를 덱의 앞에 넣는다.
        let temp = deque
        deque = [Int(input[1])!] + temp
        
    case "push_back":   //push_back X: 정수 X를 덱의 뒤에 넣는다.
        deque.append(Int(input[1])!)
        
    case "pop_front":   //pop_front: 덱의 가장 앞에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
        if !empty(deque) {
            pop(0)
        }
        
    case "pop_back":    //pop_back: 덱의 가장 뒤에 있는 수를 빼고, 그 수를 출력한다. 만약, 덱에 들어있는 정수가 없는 경우에는 -1을 출력한다.
        if !empty(deque) {
            pop(deque.count - 1)
        }
        
    case "size":    //size: 덱에 들어있는 정수의 개수를 출력한다.
        print(deque.count)
        
    case "empty":   //empty: 덱이 비어있으면 1을, 아니면 0을 출력한다.
        if deque.isEmpty { print(1) }
        else { print(0) }
        
    case "front":
        if !empty(deque) {
            print(deque[0])
        }
        
    case "back":
        if !empty(deque) {
            print(deque.last!)
        }
        
    default:
        print("Error")
    }
}
