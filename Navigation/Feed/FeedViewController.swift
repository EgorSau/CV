
//  FeedVC.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 11.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var feedView: FeedView = {
        let view = FeedView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    struct Post {
        var title: String
    }
    
    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    let postObject = Post (title: "Приветики-конфетики")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupSubView()
        self.setupStackView()
    }
    
    private func setupStackView() {
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(self.firstButton)
        self.stackView.addArrangedSubview(self.secondButton)
        self.setupFirstButton()
        self.setupSecondButton()
        
        let centerY = self.stackView.centerYAnchor.constraint(equalTo: self.feedView.centerYAnchor)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        
        NSLayoutConstraint.activate([centerY,
                                     leadingConstraint,
                                     trailingConstraint
                                    ])
    }
    
    private func setupFirstButton() {
        
        self.firstButton.backgroundColor = .systemBlue
        self.firstButton.layer.cornerRadius = 4
        self.firstButton.setTitle("#1 Go to Profile", for: .normal)
        self.firstButton.setTitleColor(.white, for: .normal)
        self.firstButton.layer.shadowOffset = .init(width: 4, height: 4)
        self.firstButton.layer.shadowRadius = 4
        self.firstButton.layer.shadowColor = UIColor.black.cgColor
        self.firstButton.layer.shadowOpacity = 0.7
        self.firstButton.addTarget(self, action: #selector(moveToPostView), for: .touchUpInside)
    }
    
    private func setupSecondButton() {
        
        self.secondButton.backgroundColor = .systemBlue
        self.secondButton.layer.cornerRadius = 4
        self.secondButton.setTitle("#2 Go to Profile", for: .normal)
        self.secondButton.setTitleColor(.white, for: .normal)
        self.secondButton.layer.shadowOffset = .init(width: 4, height: 4)
        self.secondButton.layer.shadowRadius = 4
        self.secondButton.layer.shadowColor = UIColor.black.cgColor
        self.secondButton.layer.shadowOpacity = 0.7
        self.secondButton.addTarget(self, action: #selector(moveToPostView), for: .touchUpInside)
    }
    
    
    @objc private func moveToPostView () {
        let postVC = PostVC()
        navigationController?.pushViewController(postVC, animated: true)
        postVC.postVCTitle = self.postObject.title
    }

    
    private func setupView(){
        self.view.backgroundColor = .white
        self.navigationItem.title = "Feed"
        self.navigationItem.largeTitleDisplayMode = .never
    }
    
    private func setupSubView(){
        
        self.feedView.backgroundColor = .orange
        self.view.addSubview(self.feedView)
        
        let topConstraint = self.feedView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.feedView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0)
        let trailingConstraint = self.feedView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0)
        let heightConstraint = self.feedView.heightAnchor.constraint(equalTo: self.view.heightAnchor, constant: -220)
        
        NSLayoutConstraint.activate([topConstraint,
                                     leadingConstraint,
                                     trailingConstraint,
                                     heightConstraint
                                    ])
    }
}
