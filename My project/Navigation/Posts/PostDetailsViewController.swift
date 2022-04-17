//
//  PostDetailsViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 10.04.2022.
//

import UIKit

class PostDetailsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSetup()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func viewSetup(){
        self.view.backgroundColor = .green
    }
}
