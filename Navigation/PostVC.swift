//
//  ViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 06.02.2022.
//

import UIKit

class PostVC: UIViewController {
    
    var postVCTitle = "Посты"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSetup()
        self.barButtonSetup()
    }
    
    private func viewSetup(){
        self.view.backgroundColor = .systemPink
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = postVCTitle
    }
    
    private func barButtonSetup() {
        let image = UIImage(systemName: "info.circle.fill")
        let barButton = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(goToInfoView))
        navigationItem.rightBarButtonItem = barButton
    }

    @objc private func goToInfoView() {
        let info = InfoVC()
        present(info, animated: true, completion: .none)
    }
    
}


