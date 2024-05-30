import Foundation

func solution(_ record:[String]) -> [String] {
    var users = [String: String]()  //Id, NickName
    var messages = [String]()
    
    func enter(_ userId: String, _ nickName: String) {
        users[userId] = nickName
        messages.append("\(userId)님이 들어왔습니다.")
    }
    
    func leave(_ userId: String) {
        messages.append("\(userId)님이 나갔습니다.")
    }
    
    func change(_ userId: String, _ nickName: String) {
        users[userId] = nickName
    }
    
    for i in record.indices {
        let rec = record[i].split(separator: " ").map{ String($0) }
        let order = rec[0], id = rec[1]
        
        switch order {
        case "Enter":
            enter(id, rec[2])
            
        case "Leave":
            leave(id)
            
        case "Change":
            change(id, rec[2])
            
        default:
            print("error")
        }
    }
    
    return messages.map { message in
        let userId = String(message.prefix { $0 != "님" })
        let action = String(message.dropFirst(userId.count))
        return "\(users[userId]!)\(action)"
    }
}
