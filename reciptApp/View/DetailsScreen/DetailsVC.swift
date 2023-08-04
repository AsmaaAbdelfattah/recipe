//
//  DetailsVC.swift
//  reciptApp
//
//  Created by Asmaa_Abdelfattah on 13/05/1402 AP.
//

import UIKit

class DetailsVC: UIViewController {
    @IBOutlet weak var recipeImg: UIImageView!
    @IBOutlet weak var recipeName: UILabel!
    @IBOutlet weak var recipeCal: UILabel!
    @IBOutlet weak var recipeProt: UILabel!
    @IBOutlet weak var recipeFat: UILabel!
    @IBOutlet weak var recipeIngrediants: UITextView!
    @IBOutlet weak var recipeFav: UIButton!
    @IBOutlet weak var recipecarb: UILabel!
    var recipe: Recipe?
    var isFav: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        displayRecipeDetails()
    }
    
    func displayRecipeDetails(){
        recipeImg.kf.setImage(with: URL(string: recipe?.image ?? ""), placeholder: UIImage(named: "none"), options: [.keepCurrentImageWhileLoading],  completionHandler: nil)
        recipeName.text = recipe?.name
        recipeProt.text = "Protien: " + (recipe?.proteins ?? "0")
        recipecarb.text = "Carbs: " + (recipe?.carbos ?? "0")
    
    for idx in 0..<(recipe?.ingredients.count ?? 0){
        recipeIngrediants.text.append((recipe?.ingredients[idx] ?? "") + "\n\n" )
    }
}

@IBAction func favClicked(_ sender: Any) {
    isFav = !isFav
    if isFav {
        recipeFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    }
    else{
        recipeFav.setImage(UIImage(systemName: "heart"), for: .normal)
    }
}
}
