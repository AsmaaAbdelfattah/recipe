//
//  RecipeTableViewCell.swift
//  reciptApp
//
//  Created by Asmaa_Abdelfattah on 12/05/1402 AP.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    @IBOutlet weak var recipeView: UIView!{
        didSet{
            recipeView.layer.cornerRadius = 15
            recipeView.layer.borderWidth = 1
            recipeView.layer.borderColor = UIColor.systemGray3.cgColor
        }
    }
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeCalory: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
