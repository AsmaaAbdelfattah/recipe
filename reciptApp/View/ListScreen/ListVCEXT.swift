//
//  ListVCEXT.swift
//  reciptApp
//
//  Created by Asmaa_Abdelfattah on 12/05/1402 AP.
//

import Foundation
import UIKit
import Kingfisher
extension ListVc: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseArr?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let recipeCell = tableView.dequeueReusableCell(withIdentifier: "RecipeTableViewCell", for: indexPath) as? RecipeTableViewCell else{
            return UITableViewCell()
        }
        recipeCell.recipeTitle.text = responseArr?[indexPath.row].name
        if responseArr?[indexPath.row].calories.count == 0 {
            recipeCell.recipeCalory.text = ""
        }else{
            recipeCell.recipeCalory.text = responseArr?[indexPath.row].calories
        }
        recipeCell.recipeImg.kf.setImage(with: URL(string:  responseArr?[indexPath.row].image ?? ""), placeholder: UIImage(named: "none"), options: [.keepCurrentImageWhileLoading],  completionHandler: nil)
        return recipeCell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsStoryboard = UIStoryboard(name: "Details", bundle: nil)
        guard let detailsVC = detailsStoryboard.instantiateViewController(withIdentifier: "Details") as? DetailsVC else {
            return
        }
        detailsVC.recipe = responseArr?[indexPath.row]
        detailsVC.recipe?.highlighted = CoreDataManager.getInstance().isFavourite(recipeKey: responseArr?[indexPath.row].id ?? "")
        detailsVC.isFav = CoreDataManager.getInstance().isFavourite(recipeKey: responseArr?[indexPath.row].id ?? "")
        navigationController?.pushViewController(detailsVC, animated: true)
    }
    
}
