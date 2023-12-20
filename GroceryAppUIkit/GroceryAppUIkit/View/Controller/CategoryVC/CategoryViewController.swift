//
//  CategoryViewController.swift
//  GroceryAppUIkit
//
//  Created by Ravi Dwivedi on 26/09/23.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var router:Router
    var categoryView = CategoriesView()
    var viewModel = CategoriesViewModel()
    
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
        view.addSubview(categoryView)
        categoryView.collectionView.delegate = self
        categoryView.collectionView.dataSource = self
        categoryView.moveToCategoryDes = { [weak self] model in
            self?.router.pushCategoryDescriptionView(model: model)
        }
    }
    
    private func layOut(){
        categoryView.pinToEdges(of: view)
    }
    
    private func setUpNavigationController(){
        title = "Find Products"
        navigationItem.setHidesBackButton(true, animated: false)
    }
}

//MARK:- CollectionView Delegate data Source
extension CategoryViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoriesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.categoryView.collectionView.dequeueReusableCell(withReuseIdentifier:productCategoryCollectionCell.identifier, for: indexPath) as? productCategoryCollectionCell else { return UICollectionViewCell()}
        let item = viewModel.categoriesList[indexPath.item]
        cell.model = item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = self.collectionView(collectionView, cellForItemAt: indexPath) as? productCategoryCollectionCell else { fatalError()}
        viewModel.categoriesList[indexPath.item].isSelected = true
        let model = viewModel.categoriesList[indexPath.item]
        cell.model = model
        categoryView.navigatetoCategoryDescription(model: model)
     
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = self.collectionView(collectionView, cellForItemAt: indexPath) as? productCategoryCollectionCell else { fatalError()}
        viewModel.categoriesList[indexPath.item].isSelected = false
        let model = viewModel.categoriesList[indexPath.item]
        cell.model = model
        collectionView.reloadData()
    }
}

extension CategoryViewController:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:collectionView.frame.width/2-10, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}



