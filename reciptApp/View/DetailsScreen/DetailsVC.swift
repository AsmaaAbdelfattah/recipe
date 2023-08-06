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
    var isFav: Bool?
    var coreData: CoreDataManager?
    static var reloadDelgate: RefreshData?
    let userDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // isFav = ((recipe?.highlighted) != nil)
        displayRecipeDetails()
        coreData = CoreDataManager.getInstance()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    func displayRecipeDetails(){
        recipeImg.kf.setImage(with: URL(string: recipe?.image ?? ""), placeholder: UIImage(named: "none"), options: [.keepCurrentImageWhileLoading],  completionHandler: nil)
        recipeName.text = recipe?.name
        recipeProt.text = "Protien: " + (recipe?.proteins ?? "0")
        recipecarb.text = "Carbs: " + (recipe?.carbos ?? "0")
        
        for idx in 0..<(recipe?.ingredients.count ?? 0){
            recipeIngrediants.text.append((recipe?.ingredients[idx] ?? "") + "\n\n" )
        }
        if isFav ?? true{
            recipeFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else{
            recipeFav.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func favClicked(_ sender: Any) {
        isFav = !(isFav ?? true)
        if isFav ?? true {
            if userDefault.bool(forKey: "LogIn"){
                coreData?.saveToCoreData(recipe: recipe!, isFavourite: false )
                recipeFav.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            }
            else{
                createAlert(title: "Cannot save!", message: "Please Login to save your favourite Recipies")
            }
            
        }
        else{
            coreData?.deleteFromCoreData(recipeKey: recipe?.id ?? "")
            recipeFav.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    @IBAction func backpressed(_ sender: Any) {
        DetailsVC.reloadDelgate?.reloadCoreData()
        navigationController?.popViewController(animated: true)
    }
    func createAlert(title: String, message :String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
}
