//
//  recipe.swift
//  reciptApp
//
//  Created by Asmaa_Abdelfattah on 12/05/1402 AP.
//

import Foundation
struct Recipe: Decodable{
    var id: String
    var fats: String
    var name: String
    var time: String
    var image: String
    var carbos: String
    var fibers: String
    var country: String
    var calories: String
    var proteins: String
    var description: String
    var ingredients: [String]
}
