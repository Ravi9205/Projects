//
//  WelcomeViewController.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 26/05/23.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let sigInButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sign In with Spotify", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spotify"
        view.backgroundColor = .systemGreen
        view.addSubview(sigInButton)
        sigInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        sigInButton.frame = CGRect(x: 30,
                                   y: view.height-50-view.safeAreaInsets.bottom,
                                   width: view.width-60,
                                   height: 50)
        
    }
    
    @objc func didTapSignIn(){
        let vc = LoginViewController()
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completionHandler = { [weak self] success in
           
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func handleSignIn(success:Bool){
        // Login User Or
        guard success else {
            showAlert(title:"OOPS", message:"Something Went Wrong", vc: self)
            return
        }
        let mainAppTapBarVC =  TabBarController()
        mainAppTapBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTapBarVC, animated: true)
    }
}
 
 
