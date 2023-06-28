//
//  AlertViewExtensions.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 02/06/23.
//

import Foundation
import UIKit

extension UIViewController{
    
    public func showAlert(title:String,message:String, vc:UIViewController){
        let alertVC =  UIAlertController(title:title, message:message, preferredStyle: .alert)
        let ok = UIAlertAction(title:"OK", style: .default, handler: nil)
        let cancel = UIAlertAction(title:"Cancel", style: .cancel, handler: nil)
        alertVC.addAction(ok)
        alertVC.addAction(cancel)
        self.present(alertVC, animated: true)
    }
}
