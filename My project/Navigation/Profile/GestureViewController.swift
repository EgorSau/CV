//
//  GestureViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 29.03.2022.
//

import UIKit

class GestureViewController: UIViewController {
    
    private var height: CGFloat = 80
    private var topConstraint: NSLayoutConstraint?
    private var heightConstraint: NSLayoutConstraint?
    private var right: NSLayoutConstraint?
    private var left: NSLayoutConstraint?
    private var centerY: NSLayoutConstraint?
    private var isExpanded = false
    
    private lazy var avatarImageView: UIImageView = {
        var avatarImageView = UIImageView()
        let catImage = UIImage(named: "coolCat.jpg")
        avatarImageView.image = catImage
        avatarImageView.layer.cornerRadius = self.height
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.masksToBounds = true
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        return avatarImageView
    }()
    
    private lazy var exitImageView: UIImageView = {
        var exitImageView = UIImageView()
        let exitImage = UIImage(systemName: "xmark.circle.fill")
        exitImageView.image = exitImage
        exitImageView.tintColor = .black
        exitImageView.layer.masksToBounds = true
        exitImageView.isUserInteractionEnabled = true
        exitImageView.alpha = 0
        exitImageView.isHidden = true
        exitImageView.translatesAutoresizingMaskIntoConstraints = false
        return exitImageView
    }()
    
    private let avatarTapGestureRecognizer = UITapGestureRecognizer()
    private let exitTapGestureRecognizer = UITapGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.avatarSetup()
        self.setupGesture()
        self.exitSetup()
    }

    private func avatarSetup(){
        self.view.backgroundColor = .white
        self.navigationItem.title = "Animation"
        
        self.view.addSubview(avatarImageView)
        
        //Constraints
        self.topConstraint = self.avatarImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let imageViewAspectRatio = self.avatarImageView.heightAnchor.constraint(equalTo: self.avatarImageView.widthAnchor, multiplier: 1.0)
        self.heightConstraint = self.avatarImageView.heightAnchor.constraint(equalToConstant: self.height * 2)
        
        //not active
        self.right = self.avatarImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        self.left = self.avatarImageView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        self.centerY = self.avatarImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)

        NSLayoutConstraint.activate([self.topConstraint,
                                    imageViewAspectRatio,
                                     self.heightConstraint
                                    ].compactMap({ $0 }))
    }
    
    private func exitSetup(){
        self.view.addSubview(exitImageView)
        
        //Constraints
        let top = self.exitImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let right = self.exitImageView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let height = self.exitImageView.heightAnchor.constraint(equalToConstant: 40)
        let width = self.exitImageView.widthAnchor.constraint(equalToConstant: 40)
        
        NSLayoutConstraint.activate([top,
                                     right,
                                     height,
                                     width
                                    ])
    }
    
    private func setupGesture(){
        self.avatarImageView.addGestureRecognizer(self.avatarTapGestureRecognizer)
        self.exitImageView.addGestureRecognizer(self.exitTapGestureRecognizer)
        self.avatarTapGestureRecognizer.addTarget(self, action: #selector(self.avatarHandleTapGesture))
        self.exitTapGestureRecognizer.addTarget(self, action: #selector(self.exitHandleTapGesture))
    }
    
    @objc private func avatarHandleTapGesture(_ gestureRecognizer: UITapGestureRecognizer){
        guard self.avatarTapGestureRecognizer === gestureRecognizer else { return }
        
        self.isExpanded.toggle()
        
        if self.isExpanded {
            self.topConstraint?.isActive = false
            self.heightConstraint?.isActive = false
            self.exitImageView.isHidden = false
            
            NSLayoutConstraint.activate([self.right,
                                         self.left,
                                         self.centerY
                                        ].compactMap({ $0 }))
            
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.avatarImageView.layer.cornerRadius = 0
                self.view.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: 0.3, delay: 0.0) {
                    self.exitImageView.alpha = 1
                    self.view.layoutIfNeeded()
                }
            }
        } else {
            self.right?.isActive = false
            self.left?.isActive = false
            self.centerY?.isActive = false

            NSLayoutConstraint.activate([self.topConstraint,
                                         self.heightConstraint
                                        ].compactMap({ $0 }))


            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.avatarImageView.layer.cornerRadius = self.height
                self.exitImageView.isHidden.toggle()
                self.view.layoutIfNeeded()
            } completion: { _ in
            }
        }
    }
        @objc private func exitHandleTapGesture(_ gestureRecognizer: UITapGestureRecognizer){
            guard self.exitTapGestureRecognizer === gestureRecognizer else { return }
            
            self.isExpanded.toggle()
        
            self.right?.isActive = false
            self.left?.isActive = false
            self.centerY?.isActive = false
            
            NSLayoutConstraint.activate([self.topConstraint,
                                         self.heightConstraint
                                        ].compactMap({ $0 }))
            
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.avatarImageView.layer.cornerRadius = self.height
                self.exitImageView.isHidden.toggle()
                self.view.layoutIfNeeded()
            } completion: { _ in
            }
        }
}
