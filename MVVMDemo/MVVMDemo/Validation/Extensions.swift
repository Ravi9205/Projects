//
//  Validation.swift
//  MVVMDemo
//
//  Created by Ravi Dwivedi on 02/07/23.
//

import Foundation
import UIKit

//MARK:- AlertView
extension UIViewController{
    func showAlert(title:String, message:String) {
        let alertVC = UIAlertController(title:title, message:message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title:"Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title:"OK", style: .default, handler: nil)
        alertVC.addAction(cancelAction)
        alertVC.addAction(okAction)
        self.present(alertVC, animated: true)
    }
}
