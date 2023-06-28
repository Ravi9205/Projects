//
//  HomeViewController.swift
//  Spotify
//
//  Created by Ravi Dwivedi on 24/05/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        getRecommendation()
        
    }
    
    private func setUI(){
        title = "Home"
        self.view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName:"gear"), style: .done, target: self, action: #selector(settingsButtonTapped))
        
    }
    
    @objc private func settingsButtonTapped(){
        let vc = SettingsViewController()
        vc.title = "Settings"
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func getRecommendation(){
        APICaller.shared.getRecommendedGenres{[weak self] result in
            DispatchQueue.main.async {
                switch result{
                case .success(let model):
                    let genres = model.genres
                    print("RecommendedGenreList===\(genres)")
                    var seeds = Set<String>()
                    while seeds.count < 5{
                        if let element = genres.randomElement() {
                            seeds.insert(element)
                        }
                    }
                    
                    APICaller.shared.getRecommendationList(genre: seeds) { result in
                        print(result)
                        
                    }
                case .failure( let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
    
    private func getBrowseData(){
        APICaller.shared.getNewReleases {[weak self] result in
            switch result{
            case .success(let model):
                print("Brose Data ===\(model)")
            case .failure( let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
