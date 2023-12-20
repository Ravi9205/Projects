//
//  productCategoryCollectionCell.swift
//  GroceryAppUIkit
//
//  Created by Ravi Dwivedi on 27/09/23.
//

import UIKit


class productCategoryCollectionCell:UICollectionViewCell{
    static let identifier = "productCategoryCollectionCell"
    
    var model:ProductCategoryModel?{
        didSet{
            bindProductCategoryData()
        }
    }
    
    private lazy var imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize:16, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
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
}

extension productCategoryCollectionCell{
    
    private func setupView(){
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
    }
    
    private func style(){
        layer.cornerRadius = 12
        layer.borderWidth = 2
    }
    
    private func layOut(){
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant:8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    func bindProductCategoryData(){
        guard let model = model else {return }
        titleLabel.text = model.title
        imageView.image = model.image
        backgroundColor = model.color
        layer.borderColor = model.isSelected == true ? UIColor.systemPink.cgColor : model.borderColor.cgColor
      }
    
}

