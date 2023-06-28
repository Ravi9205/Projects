//
//  ProfileViewController.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 16/06/23.
//

import UIKit
import SDWebImage

class ProfileViewController: UIViewController {
    
    var models = [String]()
    
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.isHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        fetchUserProfile()

        
        

        
        
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    private func fetchUserProfile(){
        APICaller.shared.getCurrentUserProfile { [weak self] result in
            DispatchQueue.main.async {
                switch result{
                case .success(let model):
                    print("UserData===\(model)")
                    self?.updateUI(with: model)
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.faildToGetProfile()
                }
            }
        }
    }
    
    private func updateUI(with model:UserProfile){
        tableView.isHidden = false
        //Configure Table Models
        models.append("Full name \(model.display_name)")
        models.append("Email \(model.email)")
        models.append("User ID \(model.id)")
        models.append("Plan \(model.product)")
        createTableHeader(with: model.images.first?.url)
        tableView.reloadData()
    }
    
    private func faildToGetProfile(){
        let label = UILabel(frame: .zero)
        label.text = "Faild to load profile."
        label.sizeToFit()
        label.textColor = .secondaryLabel
        view.addSubview(label)
        label.center = view.center
        
    }
    
    
   private func  createTableHeader(with string: String?){
        
       guard let urlString = string, let url = URL(string: urlString) else {
           return
       }
       
       let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.width, height: view.width/1.5))
       let imageSize:CGFloat = headerView.height/2
       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: imageSize, height: imageSize))
       headerView.addSubview(imageView)
       imageView.center = headerView.center
       imageView.contentMode = .scaleAspectFill
       imageView.sd_setImage(with: url, completed:  nil)
       imageView.layer.masksToBounds =  true
       imageView.layer.cornerRadius = imageSize/2
       tableView.tableHeaderView = headerView
    }
    
}

//MARK:= TableView Data Source
extension ProfileViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
        cell.selectionStyle = .none
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
}


extension ProfileViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}



//
