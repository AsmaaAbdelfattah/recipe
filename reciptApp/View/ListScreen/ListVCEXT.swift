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
        recipeCell.recipeCalory.text = responseArr?[indexPath.row].calories
   
        recipeCell.recipeImg.kf.setImage(with: URL(string:  responseArr?[indexPath.row].image ?? ""), placeholder: UIImage(named: "none"), options: [.keepCurrentImageWhileLoading], progressBlock: nil, completionHandler: nil)
        return recipeCell
    }
    
    
}
