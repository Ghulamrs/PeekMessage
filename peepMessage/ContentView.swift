//
//  ContentView.swift
//  peepMessage
//
//  Created by Home on 5/26/20.
//  Copyright © 2020 Home. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var euser = EditUser(users: testData)
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addUser) {
                        Text("Add User")
                    }
                }
                
                Section {
                    ForEach(euser.users) { user in
                        IndividualUser(user: user)
                    }
                    .onDelete(perform: delUser)
                    .onMove(perform: movUser)
                }
            }
            .navigationBarTitle(Text("Users"))
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    func addUser() {
        euser.users.append(User(name: "farzana", Name: "Hafeez Farzana", pid: 11))
    }
    func delUser(at offsets: IndexSet) {
        euser.users.remove(atOffsets: offsets)
    }
    func movUser(from source: IndexSet, to destination: Int) {
        euser.users.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(euser: EditUser(users: testData))
    }
}

struct IndividualUser: View {
    let user: User
    var body: some View {
        return NavigationLink(destination: UserMessage(user: user)) {
            HStack {
                Image("\(user.name)Thumb")
                    .cornerRadius(10)
                
                VStack(alignment: .leading) {
                    Text(user.Name)
                    Text("user \(user.pid)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}
