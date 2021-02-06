//
//  Users.swift
//  peepMessage
//
//  Created by Home on 5/26/20.
//  Copyright © 2020 Home. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var name: String
    var Name: String
    var pid: Int
}

let testData: [User] = [
    User(name: "gra",     Name: "Ghulam Rasool",   pid: 1),
    User(name: "shan",    Name: "Zeshan Ali",      pid: 8),
    User(name: "ahsan",   Name: "Ahsan Abdullah",  pid: 3),
    User(name: "farzana", Name: "Hafeez Farzana",  pid: 11), // gra2
    User(name: "namrah",  Name: "Namrah Rasool",   pid: 2),
    User(name: "erfa",    Name: "Erfa Rasool",     pid: 4),
    User(name: "asif",    Name: "Asif Ali Jamal",  pid: 6),
    User(name: "yasin",   Name: "Muhammad Yasin",  pid: 7), // yasin
    User(name: "saeed",   Name: "Saeed-ul-Hassan", pid: 9),
    User(name: "saleem",  Name: "M Saleem Hassan", pid: 10),
    User(name: "gra1",    Name: "G. R. Akhtar",    pid: 5),
]

struct Users_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
