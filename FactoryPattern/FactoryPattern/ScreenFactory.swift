//
//  ScreenFactory.swift
//  FactoryPattern
//
//  Created by Ravi Dwivedi on 11/09/23.
//

import Foundation
import UIKit

protocol ScreenFactoryProtocal{
    func createSettingsScreen(backgroundColor:UIColor) ->UIViewController
}

final class ScreenFactory:ScreenFactoryProtocal{
    init(){}
    
    func createSettingsScreen(backgroundColor: UIColor) -> UIViewController {
        let settingVC = UIViewController()
        settingVC.view.backgroundColor = backgroundColor
        return settingVC
    }
}
