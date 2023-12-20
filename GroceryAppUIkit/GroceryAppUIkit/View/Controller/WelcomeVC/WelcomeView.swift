//
//  WelcomeView.swift
//  GroceryAppUIkit
//
//  Created by Ravi Dwivedi on 26/09/23.
//

import UIKit



class WelcomeView:UIView{
    
    var didTapStart:(()->Void)?
    
    private lazy var backgroundImageView:UIImageView = {
        let imageView = UIImageView(image: Images.Welcome.background)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoImageView:UIImageView = {
        let imageView = UIImageView(image: Images.Welcome.logo)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        label.text = "Welcome to out store"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private lazy var descriptionLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Get your groceries in as fast as one hour"
        label.textColor = .systemGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    private lazy var startButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .primary
        button.setTitle("Get Started", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 12
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpView()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
        
    }
    
    @objc func didTapStartButton(){
        didTapStart?()
    }
}

extension WelcomeView{
    
    private func setUpView(){
        addSubview(backgroundImageView)
        addSubview(logoImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(startButton)
    }
    
    private func style(){
        
    }
    
    private func layout(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.pinToEdges(of: self)
        
        NSLayoutConstraint.activate([
            logoImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -20),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -20),
            
            descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -40),
            
            startButton.heightAnchor.constraint(equalToConstant: 67),
            startButton.leadingAnchor.constraint(equalTo:leadingAnchor,constant:30),
            startButton.trailingAnchor.constraint(equalTo:trailingAnchor,constant: -30),
            startButton.bottomAnchor.constraint(equalTo:bottomAnchor, constant: -90)
        ])
    }
}

