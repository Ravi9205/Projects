//
//  AnimalViewController.swift
//  CoreDataWithConcurrency
//
//  Created by Ravi Dwivedi on 27/07/23.
//

import UIKit

class AnimalViewController: UIViewController {
    
    @IBOutlet weak var tableView:UITableView!
    
    private var animalViewModel:AnimalViewModel = AnimalViewModel()
    var animalArray:Array<Animal>? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.getAnimalRecords()
        self.tableView.delegate = self
        self.tableView.dataSource = self
       
    }
    
    
    private func getAnimalRecords(){
        
        animalViewModel.getAnimalRecords {[weak self] animalRecords in
            DispatchQueue.main.async {
                if animalRecords != nil && animalRecords?.count != 0 {
                    self?.animalArray = animalRecords
                    self?.tableView.reloadData()
                }
                
            }
        }
    }
}

extension AnimalViewController:UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.animalArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier:AnimalTableViewCell.identifier, for: indexPath) as? AnimalTableViewCell else {
            fatalError()
        }
        
        guard let animal = self.animalArray?[indexPath.row] else {
            fatalError("Error getting data")
        }

        cell.lbl_animalName.text = animal.name
        return cell
        
    }
}

extension AnimalViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
}
