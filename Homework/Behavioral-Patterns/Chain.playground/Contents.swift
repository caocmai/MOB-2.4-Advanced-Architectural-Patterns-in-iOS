import UIKit

struct Message {
    let from: String
    let to: String
    let subject: String
}

//class LocalTransmitter  {
//    func sendMessage(message: Message) {
//        print("Message to \(message.to) sent locally")
//    }
//}
//
//class RemoteTransmitter  {
//    func sendMessage(message: Message) {
//        print("Message to \(message.to) sent remotely")
//    }
//}


class Transmitter {
    var nextLink: Transmitter?
    required init() {}
    func sendMessage(message:Message) {
        if (nextLink != nil) {
            nextLink!.sendMessage(message: message)
        } else {
            print("End of chain reached. Message not sent")
        }
    }

    class func matchEmailSuffix(message:Message) -> Bool {
      // TODO: Refactor time. Put your logic used before in this new method
        
            let fromArray = message.from.components(separatedBy: "@")
            let toArray = message.to.components(separatedBy: "@")
        
            if fromArray[1] == toArray[1] {
                return true
            } else {
               return false
            }
        
    }

    class func createChain() -> Transmitter? {
        let transmitterClasses:[Transmitter.Type] = [ PriorityTransmitter.self, LocalTransmitter.self, RemoteTransmitter.self
        ]
        var link:Transmitter?
        for tClass in transmitterClasses.reversed() {
            let existingLink = link
            link = tClass.init()
            link?.nextLink = existingLink
        }
        return link
    }
}

class LocalTransmitter: Transmitter  {
    override func sendMessage(message: Message) {
        if (Transmitter.matchEmailSuffix(message: message)) {
            print("Message to \(message.to) sent locally")
        } else {
            super.sendMessage(message: message);
        }
    }
}

class RemoteTransmitter: Transmitter {
    override func sendMessage(message: Message) {
        if (!Transmitter.matchEmailSuffix(message: message)) {
            print("Message to \(message.to) sent remotely")
        } else {
            super.sendMessage(message: message)
        }
    }
}


let messages = [
    Message(from: "adriana@ms.com", to: "mitchell@ms.com", subject: "MOB Courses"),
    Message(from: "adriana@ms.com", to: "jess@students.com", subject: "TA Updates"),
    Message(from: "ashu@ms.com", to: "all@ms.com", subject: "Priority: All-Hands Meeting")
]

//class PriorityTransmitter  {
//    func sendMessage(message: Message) {
//        print("Message to \(message.to) sent as priority")
//    }
//}

class PriorityTransmitter: Transmitter {
    override func sendMessage(message: Message) {
        if (message.subject.hasPrefix("Priority")) {
            print("Message to \(message.to) sent as priority")
        } else {
            super.sendMessage(message: message)
        }
    }
}


//// Creating the transmitter
//let localT = LocalTransmitter()
//let remoteT = RemoteTransmitter()
//let priorityT = PriorityTransmitter()

// Processing each message
//for msg in messages {
//    // TODO: Use the business rules to code this logic
//    let fromArray = msg.from.components(separatedBy: "@")
//    let toArray = msg.to.components(separatedBy: "@")
//
//    if fromArray[1] == toArray[1] {
//        localT.sendMessage(message: msg)
//    } else {
//        remoteT.sendMessage(message: msg)
//    }
//
//    if msg.subject.hasPrefix("Priority") {
//        priorityT.sendMessage(message: msg)
//    }
//}





if let chain = Transmitter.createChain() {
    for msg in messages {
        chain.sendMessage(message: msg)
    }
}
