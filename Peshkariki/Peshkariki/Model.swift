//
//  Model.swift
//  Peshkariki
//
//  Created by Egor SAUSHKIN on 04.05.2022.
//

import Alamofire
import UIKit

//Randome
    
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

//Search

struct Results: Decodable {
    let results: [Result]
}

struct Result: Decodable {
    let id: String
    let description: String?
    let urls: Urls
}

