//
//  CategoriesView.swift
//  GroceryAppUIkit
//
//  Created by Ravi Dwivedi on 26/09/23.
//

import UIKit



class CategoriesView:UIView{

    var moveToCategoryDes:((ProductCategoryModel)->Void)?

    private lazy var searchBar:UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Search Stores"
        searchBar.searchBarStyle = .minimal
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    public lazy var collectionView:UICollectionView = {
        let layOut = UICollectionViewFlowLayout()
        layOut.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layOut)
        collectionView.register(productCategoryCollectionCell.self, forCellWithReuseIdentifier: productCategoryCollectionCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupView()
        style()
        layOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
    }
    
    func navigatetoCategoryDescription(model:ProductCategoryModel){
        moveToCategoryDes?(model)
    }
}

extension CategoriesView{
    
    private func setupView(){
        addSubview(searchBar)
        addSubview(collectionView)
    }
    
    private func style(){
        backgroundColor = .white
    }
    
    private func layOut(){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)
                
        ])
    }
    
}
