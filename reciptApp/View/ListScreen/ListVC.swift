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
            recipesTable.register(UINib(nibName: "\(RecipeTableViewCell.self)", bundle: nil), forCellReuseIdentifier: "RecipeTableViewCell")
        }
    }
    
    @IBOutlet weak var logINBtn: UIButton!
    var viewModel : RecipeVM?
    var networkService : NetworkService?
    var responseArr: [Recipe]?
    let reachability = try! Reachability()
    let userDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        displayData()
      
    }
    override func viewWillAppear(_ animated: Bool) {
         if let index = self.recipesTable.indexPathForSelectedRow{
              self.recipesTable.deselectRow(at: index, animated: true)
         }
        navigationController?.setNavigationBarHidden(false, animated: animated)
        if userDefault.bool(forKey: "LogIn"){
            logINBtn.setTitle(LogInVC.userName, for: .normal)
        }
        else{
        logINBtn.setTitle("Login", for: .normal)
        }
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
            createAlert(title: "Connection failed!", message: "Please connect to network and try again")
     
        }
    }
    
    func renderView() {
        DispatchQueue.main.async {
            self.responseArr = self.viewModel?.resultRecipes
            self.recipesTable.reloadData()
        }
        self.recipesTable.reloadData()
    }

    func createAlert(title: String, message :String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        if !(userDefault.value(forKey: "LogIn") != nil){
            let logInStoryboard = UIStoryboard(name: "LogIn", bundle: nil)
            guard let logInVC = logInStoryboard.instantiateViewController(withIdentifier: "LogIn") as? LogInVC else {
                return
            }
            navigationController?.pushViewController(logInVC, animated: true)
        }
        else{
            createAlert(title: "Thank you", message: "You Already Logged In")
        }
    }
    
    @IBAction func favClicked(_ sender: Any) {
        if (userDefault.value(forKey: "LogIn") != nil){
            let favStoryboard = UIStoryboard(name: "Favourite", bundle: nil)
            guard let favVC = favStoryboard.instantiateViewController(withIdentifier: "Favourite") as? FavouriteVC else {
                return
            }
            
            navigationController?.pushViewController(favVC, animated: true)
            
        }else{
            createAlert(title: "Cannot access!", message: "Please Login to save your favourite Recipies")
        }
    }
    
}

