//
//  AlertVCExtensions.swift
//  APITestCasesDemo
//
//  Created by Ravi Dwivedi on 14/07/23.
//

import Foundation
import UIKit


extension ViewController{
    
    func showAlert(with titleName:String, message:String){
        let alertVC = UIAlertController(title: titleName, message: message, preferredStyle: .alert)
        let  okButton = UIAlertAction(title:"OK", style: .default, handler: nil)
        let cancelButton = UIAlertAction(title:"Cancel", style: .cancel, handler: nil)
        alertVC.addAction(okButton)
        alertVC.addAction(cancelButton)
        self.present(alertVC, animated: true)
    }
}
