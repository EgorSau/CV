//
//  Model.swift
//  Peshkariki
//
//  Created by Egor SAUSHKIN on 04.05.2022.
//

import Alamofire
import UIKit

    
struct Pictures: Decodable {
    let created_at: String?
    let urls: Urls
    let user: Users
}

struct Urls: Decodable {
    let small: String?
}

struct Users: Decodable {
    let name: String?
    let location: String?
}

//Экран подробной информации содержит в себе  количество скачиваний.
