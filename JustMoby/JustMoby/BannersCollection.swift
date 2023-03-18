//
//  BannersCollectionViewCell.swift
//  JustMoby
//
//  Created by Egor SAUSHKIN on 22.12.2022.
//

import UIKit

final class BannersCollection: UIView {
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "gradient")
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 1
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.sizeToFit()
        label.text = "Try three days free trial"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "You will get all outfit templates, special textures and details"
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = false
        return label
    }()
    
    private lazy var photoImage: UIImageView = {
        let photoImage = UIImageView()
        photoImage.image = UIImage(named: "coffeeCup")
        photoImage.clipsToBounds = true
        photoImage.contentMode = .scaleAspectFit
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        return photoImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupBackgroundConstraints()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackgroundConstraints(){
        self.addSubview(self.backgroundImage)
        
        let topConstraint = self.backgroundImage.topAnchor.constraint(equalTo: self.topAnchor)
        let centerY = self.backgroundImage.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let left = self.backgroundImage.leftAnchor.constraint(equalTo: self.leftAnchor)
        let right = self.backgroundImage.rightAnchor.constraint(equalTo: self.rightAnchor)
        
        NSLayoutConstraint.activate([
                                    topConstraint,
                                    centerY,
                                    left,
                                    right
                                    ])
    }
    
    private func setupConstraints(){
        self.addSubview(self.horizontalStackView)
        horizontalStackView.addArrangedSubview(verticalStackView)
        horizontalStackView.addArrangedSubview(photoImage)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(descriptionLabel)
        
        let pictureRight = self.photoImage.trailingAnchor.constraint(equalTo: self.horizontalStackView.trailingAnchor)
        let labelsRight = self.verticalStackView.trailingAnchor.constraint(equalTo: self.horizontalStackView.trailingAnchor, constant: -130)
        
        let topConstraint = self.horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor)
        let centerY = self.horizontalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let left = self.horizontalStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8)
        let right = self.horizontalStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8)
        
        NSLayoutConstraint.activate([
                                    topConstraint,
                                    centerY,
                                    left,
                                    right,
                                    pictureRight,
                                    labelsRight
                                    ])
    }
}
