//
//  CustomCollectionViewCell.swift
//  Test task
//
//  Created by Egor SAUSHKIN on 02.04.2022.
//

import UIKit
import SnapKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(updateColor), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.layer.masksToBounds = true
        button.clipsToBounds = true
        button.isSelected = false
        button.setBackgroundImage(customGray, for: .normal)
        return button
    }()
    
    let gradient = UIImage(named: "gradient.png")
    let customGray = UIImage(named: "customGray.png")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.contentView.backgroundColor = .yellow
        self.activateButtonConstraints()
        self.contentView.frame = self.button.frame
        self.contentView.contentMode = .redraw
        self.layoutIfNeeded()
        self.setNeedsLayout()
    }
    
    private func activateButtonConstraints(){
        self.contentView.addSubview(self.button)
        
        button.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.center.equalTo(self.contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func setup(with text: String) {
//        self.button.setTitle(text, for: .normal)
//    }
    
    @objc private func updateColor() {
        if button.isSelected == false {
            button.isSelected = true
            button.setBackgroundImage(gradient, for: .normal)
        } else {
            button.isSelected = false
            button.setBackgroundImage(customGray, for: .normal)
        }
    }
}
