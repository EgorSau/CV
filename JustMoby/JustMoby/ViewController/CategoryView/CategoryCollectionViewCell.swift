//
//  CategoryCollectionViewCell.swift
//  JustMoby
//
//  Created by Egor SAUSHKIN on 22.12.2022.
//

import UIKit

final class CategoryCollectionCell: UICollectionViewCell {

    private lazy var photoImage: UIImageView = {
        let photoImage = UIImageView()
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        return photoImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        self.contentView.addSubview(self.photoImage)
        
        let top = self.photoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let centerY = self.photoImage.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        let left = self.photoImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor)
        let right = self.photoImage.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
        
        NSLayoutConstraint.activate([
                                    top,
                                    centerY,
                                    left,
                                    right
                                    ])
    }
    
    func uploadPhotos(){
        let random: Bool = Bool.random()
        if random {
            self.photoImage.image = UIImage(named: "1")
        } else {
            self.photoImage.image = UIImage(named: "2")
        }
    }
}
