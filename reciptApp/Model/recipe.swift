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
    //var weeks: [String]
    var carbos: String
    var fibers: String
    var rating: Double?
    var country: String
   // var ratings: Int?
    var calories: String
    var headline: String
    var keywords: [String]
    var products: [String]
    var proteins: String
    var favorites: Int
   // var difficulty: Int
    var description: String
    var highlighted: Bool
    var ingredients: [String]
  //  var incompatibilities: String?
    var deliverable_ingredients: [String]
    var undeliverable_ingredients: [String]
}
