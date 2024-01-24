import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var standby_truck = truck_weights
    var time = 0
    var bridge_weight = 0
    var bridge = Array(repeating: 0, count: bridge_length)
    
    while !standby_truck.isEmpty || !bridge.isEmpty {
        time += 1
        bridge_weight -= bridge.removeFirst()
        
        if !standby_truck.isEmpty {
            if bridge_weight + standby_truck[0] <= weight {
                bridge.append(standby_truck.removeFirst())
                bridge_weight += bridge.last!
            }
            else {
                bridge.append(0)
            }
        }
    }
    
    return time
}
