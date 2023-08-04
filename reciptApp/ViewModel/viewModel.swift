//
//  viewModel.swift
//  reciptApp
//
//  Created by Asmaa_Abdelfattah on 13/05/1402 AP.
//

import Foundation
class RecipeVM {
    
    var bindResultToViewController : (() -> ()) = {}
    var resultRecipes : [Recipe]? {
        didSet {
            bindResultToViewController()
        }
    }

    //get data from model
    func getRecipes(url : String){
        NetworkService.fetch(url: url) { result in
            self.resultRecipes = result
        }
    }
}
