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
    static var userName: String = "Asmaa Abdelfattah"
    static var password: String = "123456789"
    var loggedIn = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        userName.delegate = self
        password.delegate = self
    }
    @IBAction func logInClicked(_ sender: Any) {
        guard let name = userName.text ,let pass = password.text , !name.isEmpty , !pass.isEmpty , pass.count >= 6 else{
            createInfoAlert(title: "Cannot logIn", message: "Please Complete Your info")
            return
        }
        if userName.text == LogInVC.userName && password.text
            == LogInVC.password {
            loggedIn.set(true, forKey: "LogIn")
            navigationController?.popViewController(animated: true)
        }
        else{
            createInfoAlert(title: "Invalid Info", message: "please recheck your name and password")
        }
    }
    func createInfoAlert(title: String, message :String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        present(alert, animated: true)
    }
}
