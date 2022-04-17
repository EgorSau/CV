//
//  Model.swift
//  Test task
//
//  Created by Egor SAUSHKIN on 02.04.2022.
//

import Foundation

struct Root: Decodable {
    let drinks: [Drinks]
}

struct Drinks: Decodable {
    let strDrink, strDrinkThumb, idDrink: String?
}
