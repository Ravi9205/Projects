//
//  UserListViewController.swift
//  OffLineStore
//
//  Created by Ravi Dwivedi on 28/04/23.
//

import UIKit

class UserListViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    private let manager: UserManager = UserManager()
    
    var userList = [User]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        userList = fetchUsers() ?? []
        tableView.reloadData()
    }
    
    func setUI(){
        tableView.delegate = self
        tableView.dataSource = self
        title = "Users"
    }
    
    
    private func fetchUsers() -> [User]?{
        return manager.fetchEmployee()
    }
    
    
    @IBAction func addNewUserBarButton(_ sender: Any) {
        guard let register = self.storyboard?.instantiateViewController(withIdentifier:"RegisterViewController") as? RegisterViewController else { return}
        self.navigationController?.pushViewController(register, animated: true)
    }
}

//MARK:- TableView Data Source
extension UserListViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"cell") else {
            return UITableViewCell()
        }
        let user = userList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = user.firstName + user.lastName
        content.secondaryText = user.email
        
        content.image = UIImage(contentsOfFile: getImage(imageName: user.imageName) ?? "")
        var imageProp = content.imageProperties
        imageProp.maximumSize = CGSize(width: 80, height: 80)
        content.imageProperties = imageProp
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}

//MARK:- TableView Delegate
extension UserListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK:- Fetch Images from Document Directory
extension UserListViewController{
    func getImage(imageName:String)-> String?{
        let imagePAth = (self.getDirectoryPath()).appendingPathComponent(imageName).appendingPathExtension("png")
        let fileURL = imagePAth.path
        if FileManager.default.fileExists(atPath:fileURL){
            return fileURL
        }
        else{
            print("No Image found")
            return nil
        }
    }
    
    //MARK:- Get Document Directory Path
    func getDirectoryPath() -> URL {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = urls[0]
        return documentsDirectory
    }
}
