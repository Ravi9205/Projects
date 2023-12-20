//
//  CategoryDescriptionView.swift
//  GroceryAppUIkit
//
//  Created by Ravi Dwivedi on 27/09/23.
//

import Foundation
import UIKit



class CategoryDescriptionView:UIView{
    
     lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
        
    }()
    
     lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
     lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        layOut()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
        
    }
    
   
}

extension CategoryDescriptionView{
    
    private func setupView(){
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
    }
    
    private func style(){
        backgroundColor = .white
    }
    
    private func  layOut(){
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 50),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo:leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)

            
        ])
    }
}
