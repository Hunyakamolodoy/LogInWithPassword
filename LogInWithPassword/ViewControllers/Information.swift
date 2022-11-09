//
//  Information.swift
//  LogInWithPassword
//
//  Created by Дмитрий Селезнев on 09.11.2022.
//

import Foundation


public struct User {
    let login = "1"
    let goodPassword = "1"
}

struct Person {
    let name: String
    let age: String
    let height: String
    let whatIDo: String
}



extension Person {
    static func getPerson() -> [Person] {
        [
        Person(
            name: "Dima",
            age: "21",
            height: "180",
            whatIDo: "nothing"
        )
        ]
    }
}
