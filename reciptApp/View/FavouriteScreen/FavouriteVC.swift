//
//  FavouriteVC.swift
//  reciptApp
//
//  Created by Asmaa_Abdelfattah on 14/05/1402 AP.
//

import UIKit
import CoreData
class FavouriteVC: UIViewController , RefreshData {
  

    @IBOutlet weak var favTable: UITableView!{
        didSet{
            favTable.delegate = self
            favTable.dataSource = self
            favTable.register(UINib(nibName: "\(RecipeTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "RecipeTableViewCell")
        }
    }
    var favRecipes: [NSManagedObject]?
    var coreData : CoreDataManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        coreData = CoreDataManager.getInstance()
        favRecipes = coreData?.fetchFromCoreData()
        if favRecipes?.count == 0 {
            createAlert(title: "No Favourites!", message: "You Have no Favourite Recipes Yet.")
        }
        DetailsVC.reloadDelgate = self
    }
    override func viewWillAppear(_ animated: Bool) {
         if let index = self.favTable.indexPathForSelectedRow{
              self.favTable.deselectRow(at: index, animated: true)
         }
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    func createAlert(title: String, message :String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        
        present(alert, animated: true)
    }
    func reloadCoreData() {
        favRecipes = coreData?.fetchFromCoreData()
        favTable.reloadData()
    }
    
}
