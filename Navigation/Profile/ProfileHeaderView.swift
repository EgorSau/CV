//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 20.02.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var buttonTopConstraint: NSLayoutConstraint?
    
    private var statusText: String = ""
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(.none, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Cool cat"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.textColor = .gray
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var profileImageView: UIImageView = {
        var profile = UIImageView()
        let catImage = UIImage(named: "coolCat.jpg")
        profile.image = catImage
        profile.layer.cornerRadius = 95
        profile.layer.borderWidth = 3
        profile.layer.borderColor = UIColor.white.cgColor
        profile.layer.masksToBounds = true
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 16
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var statusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var nextMenuButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.drawSelf()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawSelf() {
        self.backgroundColor = .lightGray
        self.setupStackView()
        self.setupStatusButton()
        self.setupNextMenuButton()
    }
    
    private func setupStatusButton() {
        
        self.addSubview(self.statusButton)
        
        self.statusButton.backgroundColor = .systemBlue
        self.statusButton.layer.cornerRadius = 4
        self.statusButton.setTitle("Set status", for: .normal)
        self.statusButton.setTitleColor(.white, for: .normal)
        self.statusButton.layer.shadowOffset = .init(width: 4, height: 4)
        self.statusButton.layer.shadowRadius = 4
        self.statusButton.layer.shadowColor = UIColor.black.cgColor
        self.statusButton.layer.shadowOpacity = 0.7
        self.statusButton.addTarget(.none, action: #selector(buttonPressed), for: .touchUpInside)
        
        self.buttonTopConstraint = self.statusButton.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 16)
        self.buttonTopConstraint?.priority = UILayoutPriority(rawValue: 999)
        let leadingConstraint = self.statusButton.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor)
        let trailingConstraint = self.statusButton.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor)
        let heightConstraint = self.statusButton.heightAnchor.constraint(equalToConstant: 50)
        
        NSLayoutConstraint.activate([leadingConstraint,
                                     trailingConstraint,
                                     heightConstraint,
                                     self.buttonTopConstraint
                                    ].compactMap({ $0 }) )
    }
    
    private func setupNextMenuButton() {
        
        self.addSubview(self.nextMenuButton)
        
        self.nextMenuButton.backgroundColor = .systemBlue
        self.nextMenuButton.layer.cornerRadius = 4
        self.nextMenuButton.setTitle("Next menu", for: .normal)
        self.nextMenuButton.setTitleColor(.white, for: .normal)
        self.nextMenuButton.layer.shadowOffset = .init(width: 4, height: 4)
        self.nextMenuButton.layer.shadowRadius = 4
        self.nextMenuButton.layer.shadowColor = UIColor.black.cgColor
        self.nextMenuButton.layer.shadowOpacity = 0.7

        let leadingConstraint = self.nextMenuButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
        let trailingConstraint = self.nextMenuButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        let heightConstraint = self.nextMenuButton.heightAnchor.constraint(equalToConstant: 50)
        let bottomConstraint = self.nextMenuButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([leadingConstraint,
                                     trailingConstraint,
                                     heightConstraint,
                                     bottomConstraint,
                                    ].compactMap({ $0 }) )
    }
    
    @objc private func buttonPressed() {
        let forPrinting = String(self.statusLabel.text!)
        statusTextChanged(textField)
        self.statusLabel.text = self.statusText
        print(forPrinting)
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        if let text = textField.text {
            self.statusText = text
        }
    }
    
    private func setupStackView() {
        self.addSubview(stackView)
        self.stackView.addArrangedSubview(self.profileImageView)
        self.stackView.addArrangedSubview(self.labelsStackView)
        self.labelsStackView.addArrangedSubview(self.nameLabel)
        self.labelsStackView.addArrangedSubview(self.statusLabel)
        self.labelsStackView.addArrangedSubview(self.textField)

        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let imageViewAspectRatio = self.profileImageView.heightAnchor.constraint(equalTo: self.profileImageView.widthAnchor, multiplier: 1.0)
        
        NSLayoutConstraint.activate([topConstraint,
                                     leadingConstraint,
                                     trailingConstraint,
                                     imageViewAspectRatio,
                                    ])
    }
}
