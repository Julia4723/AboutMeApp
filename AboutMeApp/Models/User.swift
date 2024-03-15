//
//  User.swift
//  AboutMeApp
//
//  Created by user on 10.03.2024.
//




struct User {
    var name: String
    var password: String
    var persons: Person
    
   static func getUser() -> User {
        User(
            name: "Marius",
            password: "1111",
            persons: Person(
                myName: "Juliya",
                surname: "Knyazeva",
                hobby: "Coding",
                description: "Это был человек лет тридцати двух-трех от роду, среднего роста, приятной наружности, с темно-серыми глазами, но с отсутствием всякой определенной идеи, всякой сосредоточенности в чертах лица"
            )
        )
    }
    
    struct Person {
        let myName: String
        let surname: String
        let hobby: String
        let description: String
    }
}



