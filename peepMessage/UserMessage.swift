//
//  UserMessage.swift
//  peepMessage
//
//  Created by Home on 5/26/20.
//  Copyright © 2020 Home. All rights reserved.
//

import SwiftUI

struct UserMessage: View {
    var user: User
    @State private var zoomed = false
    @ObservedObject private var messageView = MessageViewModel()
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                Image(user.name)
                    .resizable()
                    .aspectRatio(contentMode: zoomed ? .fill : .fit)
                    .onTapGesture {
                        withAnimation { self.zoomed.toggle() }
                        self.messageView.setUser(usr: UInt(self.user.pid))
                }
                if(messageView.message.count > 0) {
                    Text(messageView.message[0].message)
                } else {
                    Text("\(user.name)! has no new message")
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            if(!zoomed) {
            Image(systemName: "video.fill")
                .font(.title)
                .foregroundColor(.red)
                .padding(.all)
                .transition(.move(edge: .leading))
            }
        }
        .navigationBarTitle(Text(user.Name), displayMode: .inline)
    }
}

struct UserMessage_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView { UserMessage(user: testData[0]) }
    }
}

