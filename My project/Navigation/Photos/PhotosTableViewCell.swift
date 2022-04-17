//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 15.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    struct ViewModel {
        let image: String
    }
    let numberArray = [1...20]
    var imgArray = [String]()
    
    lazy var backView: UIView = {
       let backView = UIView()
        backView.clipsToBounds = true
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    
    private lazy var mainStack: UIStackView = {
        let mainStack = UIStackView()
        mainStack.axis = .vertical
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        return mainStack
    }()
    
    private lazy var firstLineStack: UIStackView = {
        let firstLineStack = UIStackView()
        firstLineStack.axis = .horizontal
        firstLineStack.alignment = .trailing
        firstLineStack.distribution = .equalCentering
        firstLineStack.translatesAutoresizingMaskIntoConstraints = false
        return firstLineStack
    }()
    
    private lazy var photoStack: UIStackView = {
        let photoStack = UIStackView()
        photoStack.axis = .horizontal
        photoStack.spacing = 8
        photoStack.translatesAutoresizingMaskIntoConstraints = false
        return photoStack
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 0
        titleLabel.text = "Photos"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var arrowImage: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.backgroundColor = .white
        arrowImage.image = UIImage(systemName: "arrow.right")
        arrowImage.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        return arrowImage
    }()
    
    lazy var photoImage1: UIImageView = {
        let photoImage = UIImageView()
        photoImage.contentMode = .scaleAspectFill
        photoImage.clipsToBounds = true
        photoImage.layer.cornerRadius = 6
        photoImage.backgroundColor = .gray
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        return photoImage
    }()
    
    lazy var photoImage2: UIImageView = {
        let photoImage = UIImageView()
        photoImage.contentMode = .scaleAspectFill
        photoImage.clipsToBounds = true
        photoImage.layer.cornerRadius = 6
        photoImage.backgroundColor = .gray
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        return photoImage
    }()
    
    lazy var photoImage3: UIImageView = {
        let photoImage = UIImageView()
        photoImage.contentMode = .scaleAspectFill
        photoImage.clipsToBounds = true
        photoImage.layer.cornerRadius = 6
        photoImage.backgroundColor = .gray
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        return photoImage
    }()
    
    lazy var photoImage4: UIImageView = {
        let photoImage = UIImageView()
        photoImage.contentMode = .scaleAspectFill
        photoImage.clipsToBounds = true
        photoImage.layer.cornerRadius = 6
        photoImage.backgroundColor = .gray
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        return photoImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupStack()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeToString(){
        for eachNumber in numberArray {
            self.imgArray = eachNumber.map({String($0)})
        }
    }
    
    func uploadImages(){
        self.photoImage1.image = UIImage(named: self.imgArray[0])
        self.photoImage2.image = UIImage(named: self.imgArray[1])
        self.photoImage3.image = UIImage(named: self.imgArray[2])
        self.photoImage4.image = UIImage(named: self.imgArray[3])
    }
    
    private func setupStack(){
        self.contentView.addSubview(backView)
        self.backView.addSubview(mainStack)
        self.mainStack.addArrangedSubview(firstLineStack)
        self.mainStack.addArrangedSubview(photoStack)
        self.firstLineStack.addArrangedSubview(titleLabel)
        self.firstLineStack.addArrangedSubview(arrowImage)
        self.photoStack.addArrangedSubview(photoImage1)
        self.photoStack.addArrangedSubview(photoImage2)
        self.photoStack.addArrangedSubview(photoImage3)
        self.photoStack.addArrangedSubview(photoImage4)
        
        //backview
        let topViewConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingViewConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingViewConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomViewConstraint = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        
        //stack
        let topConstraint = self.mainStack.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 12)
        let leadingConstraint = self.mainStack.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 12)
        let trailingConstraint = self.mainStack.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -12)
        let bottomConstraint = self.mainStack.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)
        
        //title
        let bottomTitleConstraint = self.titleLabel.bottomAnchor.constraint(equalTo: photoStack.topAnchor, constant: -12)
        
        //arrow
        let centerY = self.arrowImage.centerYAnchor.constraint(equalTo: self.arrowImage.centerYAnchor)
        
        //images
        let image1ViewAspectRatio = self.photoImage1.heightAnchor.constraint(equalTo: self.photoImage1.widthAnchor, multiplier: 1.0)
        let image2ViewAspectRatio = self.photoImage2.heightAnchor.constraint(equalTo: self.photoImage2.widthAnchor, multiplier: 1.0)
        let image3ViewAspectRatio = self.photoImage3.heightAnchor.constraint(equalTo: self.photoImage3.widthAnchor, multiplier: 1.0)
        let image4ViewAspectRatio = self.photoImage4.heightAnchor.constraint(equalTo: self.photoImage4.widthAnchor, multiplier: 1.0)
        
        NSLayoutConstraint.activate([
                                    topViewConstraint,
                                    bottomViewConstraint,
                                    leadingViewConstraint,
                                    trailingViewConstraint,
                                    topConstraint,
                                    trailingConstraint,
                                    leadingConstraint,
                                    bottomConstraint,
                                    bottomTitleConstraint,
                                    centerY,
                                    image1ViewAspectRatio,
                                    image2ViewAspectRatio,
                                    image3ViewAspectRatio,
                                    image4ViewAspectRatio
                                    ])
    }
}
