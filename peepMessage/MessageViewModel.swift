//
//  MessageViewModel.swift
//  peepMessage
//
//  Created by Home on 5/27/20.
//  Copyright © 2020 Home. All rights reserved.
//

import Foundation

struct MessageView {
    var messages: Message
    
    init(message: Message) {
        self.messages = message
    }
    var success: Int {
        return self.messages.success
    }
    var message: String {
        return self.messages.message
    }
}

class MessageViewModel : ObservableObject {
    let yourMessage = UrMessage()
    @Published var message = [MessageView]()
    init() {
        yourMessage.getNewMessage { message in
            self.message = message.map(MessageView.init)
        }
    }
    
    func setUser(usr: UInt) {
        yourMessage.setUser(pid: usr)
        yourMessage.getNewMessage { message in
            self.message = message.map(MessageView.init)
        }
    }
}
