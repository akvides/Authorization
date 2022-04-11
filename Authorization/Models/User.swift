//
//  User.swift
//  Authorization
//
//  Created by Василий Полторак on 11.04.2022.
//

struct User {
    let id: Int
    let login: String
    let password: String
    let name: String
    let surname: String
    let age: Int
    
    var collection: [BoardGame]
    
    static func getUsers() -> [User] {
        [
            User(id: 1,
                 login: "ednzlo",
                 password: "qwerty",
                 name: "Василий",
                 surname: "Полторак",
                 age: 27,
                 collection:
                    [
                        BoardGame(id: 1,
                                  name: "Carcassone",
                                  image: "",
                                  playingTime: 30,
                                  weight: .medium),
                        BoardGame(id: 2,
                                  name: "Codenames",
                                  image: "codenames",
                                  playingTime: 15,
                                  weight: .light),
                        BoardGame(id: 3,
                                  name: "The Isle of Cats",
                                  image: "",
                                  playingTime: 60,
                                  weight: .medium),
                        BoardGame(id: 4,
                                  name: "Pandemic: Reign of Cthulhu",
                                  image: "",
                                  playingTime: 40,
                                  weight: .medium),
                        BoardGame(id: 6,
                                  name: "Firefly: The Game",
                                  image: "",
                                  playingTime: 120,
                                  weight: .hard),
                    ]
                )
        ]
    }
    
}

struct BoardGame {
    let id: Int
    let name: String
    let image: String
    let playingTime: Int
    let weight: Weight
    
    static func getBoardGames() -> [BoardGame] {
        [
            BoardGame(id: 1,
                      name: "Carcassone",
                      image: "",
                      playingTime: 30,
                      weight: .medium),
            BoardGame(id: 2,
                      name: "Codenames",
                      image: "codenames",
                      playingTime: 15,
                      weight: .light),
            BoardGame(id: 3,
                      name: "The Isle of Cats",
                      image: "",
                      playingTime: 60,
                      weight: .medium),
            BoardGame(id: 4,
                      name: "Pandemic: Reign of Cthulhu",
                      image: "",
                      playingTime: 40,
                      weight: .medium),
            BoardGame(id: 5,
                      name: "Arkham Horror ",
                      image: "Arkham",
                      playingTime: 240,
                      weight: .hard),
            BoardGame(id: 6,
                      name: "Firefly: The Game",
                      image: "",
                      playingTime: 120,
                      weight: .hard),
            
        ]
    }
}

enum Weight: String {
    case light = "★"
    case medium = "★★"
    case hard = "★★★"
}
