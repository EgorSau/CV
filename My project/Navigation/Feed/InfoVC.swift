//
//  InfoVC.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 15.02.2022.
//

import UIKit

class InfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        self.buttonSetup()
    }
    
    private func buttonSetup(){
        let postButton = UIButton(frame: CGRect(x: 30, y: 770, width: 370, height: 50))
        postButton.backgroundColor = .systemBlue
        postButton.layer.cornerRadius = 12
        postButton.setTitleColor(.white, for: .normal)
        postButton.setTitle("Отправить", for: .normal)
        postButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        self.view.addSubview(postButton)
    }
    
    @objc private func showAlert () {
        let alert = UIAlertController(title: "Упс", message: "Что-то пошло не так...", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "ОК, согласен", style: .default, handler: .some({ (action) in
            print("Он согласен")
        }))
        let action2 = UIAlertAction(title: "Нет, не согласен", style: .default, handler: .some({ (action) in
            print("Он не согласен")
        }))
        present(alert, animated: true, completion: .none)
        alert.addAction(action1)
        alert.addAction(action2)
    }
}
