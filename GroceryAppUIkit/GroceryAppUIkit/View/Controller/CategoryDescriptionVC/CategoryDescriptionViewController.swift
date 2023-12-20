//
//  CategoryDescriptionViewController.swift
//  GroceryAppUIkit
//
//  Created by Ravi Dwivedi on 27/09/23.
//

import UIKit

class CategoryDescriptionViewController: UIViewController {

    var router:Router
    var productCategoryModel:ProductCategoryModel?
    var categoryDescriptionView = CategoryDescriptionView()
    
    init(router:Router) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        layOut()
        setUpNavigationController()

    }
    
    private func setUp(){
        view.addSubview(categoryDescriptionView)
        guard let model = productCategoryModel else {return}
        categoryDescriptionView.imageView.image = model.image
        categoryDescriptionView.titleLabel.text = model.title
        //categoryDescriptionView.descriptionLabel.text = model.title.description
        
    }
    private func layOut(){
        categoryDescriptionView.pinToEdges(of: view)
    }
    
    private func setUpNavigationController(){
        title = "Category Descrition"
        navigationItem.backButtonTitle = "Back"
    }
    
}

