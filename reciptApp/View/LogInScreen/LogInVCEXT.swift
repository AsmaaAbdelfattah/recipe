//
//  LogInVCEXT.swift
//  reciptApp
//
//  Created by Asmaa_Abdelfattah on 15/05/1402 AP.
//

import Foundation
import UIKit
extension LogInVC:UITextFieldDelegate{
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            userName.endEditing(true)
            password.endEditing(true)
            return true
        }
       
    }
