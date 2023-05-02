//
//  RegisterViewController.swift
//  OffLineStore
//
//  Created by Ravi Dwivedi on 28/04/23.
//

import UIKit
import CoreData
import PhotosUI

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstNameTxtField:UITextField!
    @IBOutlet weak var LastNameTxtField:UITextField!
    @IBOutlet weak var emailTxtField:UITextField!
    @IBOutlet weak var passwordTxtField:UITextField!
    @IBOutlet weak var userImageView:UIImageView!
    var isImageSelected = false
    
    private let manager: UserManager = UserManager()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI(){
        title = "Add Users"
        addGestureOnTap()
        userImageView.layer.cornerRadius = userImageView.frame.size.height/2
    }
    
    
    @IBAction func  registerButtontapped(_ sender:Any){
        
        guard let firstNameTxt = firstNameTxtField.text, firstNameTxt != "" else {
            openAlert(title:"Alert", message:"FirstName Field can't be empty")
            return
        }
        
        guard let lastNameTxt = LastNameTxtField.text, lastNameTxt != "" else {
            openAlert(title:"Alert", message:"LastName Field can't be empty")
            return
        }
        
        guard let email = emailTxtField.text, email != "" else {
            openAlert(title:"Alert", message:"Email Field can't be empty")
            return
        }
        
        guard let passwordTxt = passwordTxtField.text, passwordTxt != "" else {
            openAlert(title:"Alert", message:"Password field can't be empty")
            return
        }
        
        if !isImageSelected {
            openAlert(title:"Alert", message:"Image can't be an empty please select an image!")
            return
        }
        
        let imageName = UUID().uuidString
        let user = User(id:UUID(),email: email, firstName:firstNameTxt, lastName:lastNameTxt, password: passwordTxt, imageName:imageName)
        saveImageIntoDocumentDirectory(imageName: imageName)
        saveUserInfo(user: user)
        
    }
    
 //MARK:- Save Images into document directory and later save their URL name into Core DB
    private func saveImageIntoDocumentDirectory(imageName:String){
        
        do{
            let documentsDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            print("documentsDirectory:", documentsDirectory.path)
            let fileURL = documentsDirectory.appendingPathComponent(imageName).appendingPathExtension("png")
           if let data = userImageView.image?.pngData(), !FileManager.default.fileExists(atPath: fileURL.path) {
                do{
                    try data.write(to: fileURL)
                }
                catch let error{
                    print("Error saving images \(error)")
                }
            }
        }
        catch let err{
            print("error creating document Directory  \(err)")
        }
        
    }
    
    private func addGestureOnTap(){
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openGallery))
        userImageView.addGestureRecognizer(imageTap)
    }
}

//MARK:-  Alert and Gallery
extension RegisterViewController{
    private func openAlert(title:String,message:String){
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok =  UIAlertAction(title:"OK", style: .default, handler: nil)
        alertVC.addAction(ok)
        self.present(alertVC, animated: true)
    }
    
    @objc private func openGallery(){
        var config = PHPickerConfiguration()
        config.selectionLimit = 1
        let pickerVC = PHPickerViewController(configuration: config)
        pickerVC.delegate = self
        self.present(pickerVC, animated: true)
    }
}

//MARK:- Save Users Details into Core DB
extension RegisterViewController{
    func saveUserInfo(user:User){
        manager.createEmployee(user: user)
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK:- PHPicker Delegate Latest Gallery selection
extension RegisterViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        self.dismiss(animated: true)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { image, error in
                guard let image = image as? UIImage else {
                    return
                }
                self.isImageSelected = true
                DispatchQueue.main.async {
                    self.userImageView.image = image
                }
            }
        }
    }
}
