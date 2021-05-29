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
        [User(login: "User1", password: "Password", person: Person.getPerson()[0]),
         User(login: "User2", password: "Password", person: Person.getPerson()[1])]
    }
}

struct Person {
    let name: String
    let surname: String
    let description: String
    let age: Int
    let image: String
    
    var fullname: String {
        "\(name) \(surname)"
    }
    
    static func getPerson() -> [Person] {
        [Person(name: "Philip",
                surname: "Fry",
                description: "Philip is a pizza delivery boy who, during the first few seconds in the year 2000, falls into a cryogenic tank while delivering a pizza to Applied Cryogenics.",
                age: 32,
                image: "Fryphoto"),
         Person(name: "Leela",
                surname: "Turanga",
                description: "Leela is spaceship captain, pilot, and head of all aviation services on board the Planet Express Ship.",
                age: 33,
                image: "Leelaphoto")]
    }
}
