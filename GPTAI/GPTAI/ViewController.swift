//
//  ViewController.swift
//  GPTAI
//
//  Created by Ravi Dwivedi on 09/11/23.
//

import UIKit
import OpenAISwift

class ViewController: UIViewController {

    private let textInputField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Type here...."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .red
        return textField
    }()
    
    
    var models = [String]()
    
    private let tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
        return tableView
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(textInputField)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        textInputField.delegate = self
        setUI()
    }
    
    
    private func setUI(){
        
        NSLayoutConstraint.activate([
            //TextField
            textInputField.heightAnchor.constraint(equalToConstant: 50),
            textInputField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor,constant: 10),
            textInputField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor,constant: -10),
            textInputField.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor),
            
            //TableView
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: textInputField.topAnchor)
        ])
    }
}


//MARK:- TableView Data Source
extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}


//MARK:- TableView Delegate
extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}


//MARK:- TextField Delegate
extension ViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text , !text.isEmpty {
            self.models.append(text)
            APIManger.shared.getResponse(input: text) { [weak self] result in
                switch result{
                case .success(let model):
                    self?.models.append(model)
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                        self?.textInputField.text = nil
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }
        }
        return true
    }
}

