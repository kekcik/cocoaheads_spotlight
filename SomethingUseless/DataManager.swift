//
//  DataManager.swift
//  SomethingUseless
//
//  Created by Иван Трофимов on 21.05.2020.
//  Copyright © 2020 Иван Трофимов. All rights reserved.
//

import Foundation

class DataManager {
    
    static let testUsers: [User] = [
        User(name: "Негода Герасим", phone: "+79992137500", group: "Работа", id: 8666139),
        User(name: "Одинцов Макар", phone: "+79992137501", group: "Работа", id: 8666140),
        User(name: "Корнилов Богдан", phone: "+79992137502", group: "Семья", id: 8666141),
        User(name: "Романов Шерлок", phone: "+79992137503", group: "Семья", id: 8666142),
        User(name: "Передрий Чеслав", phone: "+79992137504", group: "Семья", id: 8666143),
    ]

}

struct User {
    let name: String
    let phone: String
    let group: String
    let id: Int
}
