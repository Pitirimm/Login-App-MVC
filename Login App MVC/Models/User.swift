//
//  User.swift
//  Login App MVC
//
//  Created by Yuriy Martinovskiy on 29.05.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> [User] {
        [User(login: "User1", password: "Password", person: Person.getPerson()),
         User(login: "User2", password: "Password", person: Person.getPerson())]
    }
}

struct Person {
    let name: String
    let surname: String
    let image: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Petr", surname: "Ivanov", image: "Image")
    }
}
