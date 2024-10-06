import Foundation

struct Time: Comparable {
    var minutes: Int
    var seconds: Int
    
    init(_ time: String) {
        let split = time.split(separator: ":").compactMap { Int($0) }
        self.minutes = split[0]
        self.seconds = split[1]
    }
    
    func description() -> String {
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    mutating func next(_ videoLength: Time) {
        seconds += 10
        
        if seconds >= 60 {
            minutes += 1
            seconds -= 60
        }
        
        if self > videoLength {
            self = videoLength
        }
    }
    
    mutating func prev() {
        seconds -= 10
        
        if seconds < 0 {
            if minutes > 0 {
                minutes -= 1
                seconds += 60
            } else {
                seconds = 0
            }
        }
    }
    
    mutating func inOpeningTime(_ op_start: Time, _ op_end: Time) {
        if op_start <= self && self <= op_end {
            self = op_end
        }
    }
    
    static func < (lhs: Time, rhs: Time) -> Bool {
        return lhs.minutes < rhs.minutes || (lhs.minutes == rhs.minutes && lhs.seconds < rhs.seconds)
    }
}

func solution(_ video_len: String, _ pos: String, _ op_start: String, _ op_end: String, _ commands: [String]) -> String {
    let videoLength = Time(video_len)
    let op_start = Time(op_start)
    let op_end = Time(op_end)
    
    var currentTime = Time(pos)
    currentTime.inOpeningTime(op_start, op_end)
    
    for command in commands {
        if command == "next" {
            currentTime.next(videoLength)
        } else if command == "prev" {
            currentTime.prev()
        }
        
        currentTime.inOpeningTime(op_start, op_end)
    }
    
    return currentTime.description()
}
