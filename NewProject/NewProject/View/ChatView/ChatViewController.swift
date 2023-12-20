//
//  ViewController.swift
//  NewProject
//
//  Created by Ravi Dwivedi on 06/10/23.
//

import UIKit
import Foundation

class ChatViewController: UIViewController {
    
    private var userNameField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter User Name"
        //textField.backgroundColor = .gray
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.keyboardType = .default
        textField.returnKeyType = .done
        return textField
    }()
    
    private var submitButton:UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        return button
        
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(userNameField)
        view.addSubview(submitButton)
       
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextFieldContrainst), name:UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
      

        
    }
    
    override func viewDidLayoutSubviews() {
        setUpLayout()
    }
    
    
    
    
    
    private func setUpLayout(){
        
        NSLayoutConstraint.activate([
            //UserTextFiled
            userNameField.leadingAnchor.constraint(equalTo:view.leadingAnchor, constant: 20),
            userNameField.trailingAnchor.constraint(equalTo: submitButton.leadingAnchor, constant: -20),
            userNameField.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5),
            userNameField.heightAnchor.constraint(equalToConstant: 50),
        
            
            //Submit Button
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5),
            
            submitButton.widthAnchor.constraint(equalToConstant:100),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
            
        
        ])
        
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
}

extension ChatViewController{
    
    @objc  func updateTextFieldContrainst(notification:NSNotification){
        if  let keyboardFrame:NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardHeight = keyboardFrame.cgRectValue.height
           // let bottomSpace = self.view.frame.height - (userNameField.frame.origin.y + submitButton.frame.origin.y)
            self.view.frame.origin.y -= keyboardHeight - 20
            
        }
        
    }
    
    @objc func hideKeyboardWillHide(){
       // self.view.frame.origin.y = 0
        
    }
    
    @objc func hideKeyboard(){
        self.view.endEditing(true)
    }
    
}


