//
//  PhotosTableViewCell.swift
//  Peshkariki
//
//  Created by Egor SAUSHKIN on 15.05.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    var imagesArray = [UIImage]()
    
    lazy var photoImage: UIImageView = {
        let photoImage = UIImageView()
        photoImage.contentMode = .scaleAspectFill
        photoImage.clipsToBounds = true
        photoImage.layer.cornerRadius = 6
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        return photoImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "PhotoCell")
        self.accessoryType = .disclosureIndicator
        self.selectionStyle = .blue
        self.backgroundColor = .systemYellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelf(){
    }
    
}


