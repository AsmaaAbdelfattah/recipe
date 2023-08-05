//
//  LogInVC.swift
//  reciptApp
//
//  Created by Asmaa_Abdelfattah on 13/05/1402 AP.
//

import UIKit

class LogInVC: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    {
        didSet{
            let leftImage = UIImageView()
            let image1 = UIImage(named: "person")
            leftImage.image = image1
            let contentView = UIView()
            contentView.addSubview(leftImage)
            contentView.frame = CGRectMake(0, 0, 30, 15)
            leftImage.frame = CGRectMake(10, 0, 16, 16)
            userName.leftView = contentView
            userName.leftViewMode = UITextField.ViewMode.always
            userName.tintColor = UIColor.white
            userName.layer.borderWidth = 1
            userName.layer.borderColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.00).cgColor
            userName.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var password: UITextField!{
        didSet{
            let leftImage = UIImageView()
            let image1 = UIImage(named: "lock")
            leftImage.image = image1
            let contentView = UIView()
            contentView.addSubview(leftImage)
            contentView.frame = CGRectMake(0, 0, 30, 15)
            leftImage.frame = CGRectMake(10, 0, 16, 16)
            password.leftView = contentView
            password.leftViewMode = UITextField.ViewMode.always
            password.tintColor = UIColor.white
            password.layer.borderWidth = 1
            password.layer.borderColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.00).cgColor
            password.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var logIn: UIButton!{
        didSet{
            logIn.layer.cornerRadius = 15
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   
    @IBAction func logInClicked(_ sender: Any) {
        guard let name = userName.text ,let password = password.text , !name.isEmpty , !password.isEmpty , password.count >= 6 else{
            createInfoAlert(title: "Cannot logIn", message: "Please Complete Your info")
            return
        }
    }
    func createInfoAlert(title: String, message :String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
    
    
}
