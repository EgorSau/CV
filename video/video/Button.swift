//
//  Button.swift
//  video
//
//  Created by Egor SAUSHKIN on 04.06.2022.
//

import UIKit

class Button: UIView {
    
    var vector1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-5")
        return image
    }()
    
    var vector2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-6")
        return image
    }()
    
    var vector3: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-7")
        return image
    }()
    
    var vector4: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Vector-8")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSelf(){
        self.addSubview(vector1)
        self.addSubview(vector2)
        self.addSubview(vector3)
        self.addSubview(vector4)
        
        vector1.translatesAutoresizingMaskIntoConstraints = false
        vector2.translatesAutoresizingMaskIntoConstraints = false
        vector3.translatesAutoresizingMaskIntoConstraints = false
        vector4.translatesAutoresizingMaskIntoConstraints = false
        
        vector1.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        vector2.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        vector3.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        vector4.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        vector1.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        vector2.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        vector3.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        vector4.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
}
