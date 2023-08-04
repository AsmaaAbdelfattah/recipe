//
//  ViewController.swift
//  reciptApp
//
//  Created by Asmaa_Abdelfattah on 12/05/1402 AP.
//

import UIKit
import Reachability
class ListVc: UIViewController {
    @IBOutlet weak var recipesTable: UITableView!{
        didSet{
            recipesTable.delegate = self
            recipesTable.dataSource = self
        }
    }
    var viewModel : RecipeVM?
    var networkService : NetworkService?
    var responseArr: [Recipe]?
    let reachability = try! Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
      
    }
    
    //Connectivity check
    func isConnected()-> Bool{
        try! reachability.startNotifier()
        switch reachability.connection{
        case .cellular :
            return true
        case .wifi:
            return true
        default:
            return false
        }
    }
    
    // fetching data from api or database
    func displayData(){
        if isConnected(){
            self.viewModel = RecipeVM()
            self.viewModel?.getRecipes(url: recipeUrl )
            self.viewModel?.bindResultToViewController = {() in
                self.renderView()}
        }
        
        else{
            createConnectionAlert(title: "Connection failed!", message: "Please connect to network and try again")
            //realmResponse = database.fetchFromDB()
            //print(realmResponse?.count)
            //    displayFromRealm()
            
        }
    }
    
    func renderView() {
        DispatchQueue.main.async {
            self.responseArr = self.viewModel?.resultRecipes
            //                   self.saveApi()
            self.recipesTable.reloadData()
        }
        self.recipesTable.reloadData()
    }

    func createConnectionAlert(title: String, message :String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
}

