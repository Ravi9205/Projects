//
//  TabBarController.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 24/05/23.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createVC()
    }
    
    
    private func createVC() -> Void{
        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let  libraryVC = LibraryViewController()
        homeVC.title = "Browse"
        searchVC.title = "Search"
        libraryVC.title = "Library"
        
        homeVC.navigationItem.largeTitleDisplayMode = .always
        searchVC.navigationItem.largeTitleDisplayMode = .always
        libraryVC.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: homeVC)
        let nav2 = UINavigationController(rootViewController: searchVC)
        let nav3 = UINavigationController(rootViewController: libraryVC)
        
        nav1.navigationBar.tintColor = .label
        nav2.navigationBar.tintColor = .label
        nav3.navigationBar.tintColor = .label
       

        
        
        nav1.tabBarItem =  UITabBarItem(title:"Home", image: UIImage(systemName:"house"), tag: 1)
        nav2.tabBarItem =  UITabBarItem(title:"Search", image: UIImage(systemName:"magnifyingglass"), tag: 2)
        nav3.tabBarItem =  UITabBarItem(title:"Library", image: UIImage(systemName:"music.note.list"), tag: 3)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1,nav2,nav3], animated: false)
         
    }
    
    
}
