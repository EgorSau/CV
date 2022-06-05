//
//  WinnerViewController.swift
//  video
//
//  Created by Egor SAUSHKIN on 05.06.2022.
//

import UIKit

class WinnerViewController: UIViewController {
    
    var label: UILabel = {
        let label = UILabel()
        label.text = "YOU WIN"
        label.textColor = .white
        label.font = UIFont(name: "OpenSans-Regular", size: 50)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        self.view.addSubview(label)
        label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
