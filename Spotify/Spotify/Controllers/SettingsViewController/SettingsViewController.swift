//
//  SettingsViewController.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 26/05/23.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    private var section = [Section]()
    
    private var tableView: UITableView = {
        let tableView =  UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        configureModels()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    
    private func setUI(){
        self.title = "Settings"
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    private func configureModels(){
        section.append(Section(title:"Profile", option: [Option(title:"view your profile", handler: { [weak self] in
            self?.viewProfile()
        })]))
        
        section.append(Section(title:"Account", option: [Option(title:"Sign Out", handler: { [weak self] in
            self?.signOutTapped()
        })]))
        
        
    }
    
    private func signOutTapped(){
        
    }
    
    
    private func viewProfile(){
        let vc = ProfileViewController()
        vc.title = "Profile"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
        
        
    }
    
}

//MARK:- Tableview Delegate Data
extension SettingsViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
      return  section.count
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.section[section].option.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = section[indexPath.section].option[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell",for:indexPath)
        cell.textLabel?.text = model.title
        return cell
    }
    
}

//MARK:- Tableview Delgate
extension SettingsViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let model = section[indexPath.section].option[indexPath.row]
        self.tableView.deselectRow(at: indexPath, animated: true)
        model.handler()
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let model = self.section[section]
        return model.title
    }
}
