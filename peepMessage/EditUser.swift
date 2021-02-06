//
//  EditUser.swift
//  peepMessage
//
//  Created by Home on 5/26/20.
//  Copyright © 2020 Home. All rights reserved.
//

import SwiftUI
import Combine

class EditUser : ObservableObject {
    var users: [User] {
        didSet { didChange.send() }
    }

    init(users: [User] = []) {
        self.users = users
    }
    
    var didChange = PassthroughSubject<Void, Never>()
}

struct EditUser_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
