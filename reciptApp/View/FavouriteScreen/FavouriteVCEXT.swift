//
//  FavouriteVCEXT.swift
//  reciptApp
//
//  Created by Asmaa_Abdelfattah on 14/05/1402 AP.
//

import Foundation
import UIKit

extension FavouriteVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favRecipes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recipeCell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath) as? RecipeTableViewCell else{
            return UITableViewCell()
        }
        recipeCell.recipeTitle.text = favRecipes?[indexPath.row].value(forKey: "name") as? String

        recipeCell.recipeCalory.text = favRecipes?[indexPath.row].value(forKey: "calories") as? String
        
        recipeCell.recipeImg.kf.setImage(with: URL(string:  favRecipes?[indexPath.row].value(forKey: "image") as? String ?? ""), placeholder: UIImage(named: "none"), options: [.keepCurrentImageWhileLoading],  completionHandler: nil)
        return recipeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsStoryboard = UIStoryboard(name: "Details", bundle: nil)
        guard let detailsVC = detailsStoryboard.instantiateViewController(withIdentifier: "Details") as? DetailsVC else {
            return
        }
        let recipeObj = Recipe(id: favRecipes?[indexPath.row].value(forKey: "id") as? String ?? "",
                               fats: favRecipes?[indexPath.row].value(forKey: "fats") as? String ?? "",
                               name: favRecipes?[indexPath.row].value(forKey: "name") as? String ?? "",
                               time: "",
                               image: favRecipes?[indexPath.row].value(forKey: "image") as? String ?? "",
                               carbos: favRecipes?[indexPath.row].value(forKey: "carbos") as? String ?? "",
                               fibers: favRecipes?[indexPath.row].value(forKey: "fibers") as? String ?? "",
                               country: "",
                               calories: favRecipes?[indexPath.row].value(forKey: "calories") as? String ?? "",
                               proteins: favRecipes?[indexPath.row].value(forKey: "proteins") as? String ?? "",
                               description: "",
                               ingredients: favRecipes?[indexPath.row].value(forKey: "ingrediants") as? [String] ?? [],
                               highlighted:  favRecipes?[indexPath.row].value(forKey: "isFav") as? Bool ?? true)
        detailsVC.recipe = recipeObj
        detailsVC.recipe?.highlighted = favRecipes?[indexPath.row].value(forKey: "isFav") as? Bool ?? true
      //  detailsVC.isFav = favRecipes?[indexPath.row].value(forKey: "isFav") as? Bool ?? false
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
