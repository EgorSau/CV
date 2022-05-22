//
//  TestTableViewCell.swift
//  Test task
//
//  Created by Egor SAUSHKIN on 23.04.2022.
//

import UIKit
import SnapKit

class TestTableViewCell: UITableViewCell {
    
    struct ViewModel: ViewModelProtocol {
        let title: String
    }
    
    lazy var firstButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 14
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    lazy var secondButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .purple
//        button.setTitleColor(.white, for: .normal)
//        button.layer.cornerRadius = 14
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()
    
    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .systemGray
        stack.axis = .horizontal
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupStack()
        self.setupButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.contentView.backgroundColor = .white
        self.contentView.addSubview(self.stack)
//        self.stack.addArrangedSubview(self.firstButton)
//        self.stack.addArrangedSubview(self.secondButton)

        for _ in 0..<2 {
            self.stack.addArrangedSubview(self.firstButton)
        }
        
        
//        for _ in 0..<5 {
//            let button = UIButton()
//            button.backgroundColor = .systemOrange
//            button.setTitleColor(.white, for: .normal)
//            button.layer.cornerRadius = 14
//            self.stack.addArrangedSubview(button)
//        }
//
//        for view in self.stack.arrangedSubviews {
//            NSLayoutConstraint.activate([
//                view.widthAnchor.constraint(equalToConstant: 100),
//                view.heightAnchor.constraint(equalToConstant: 35),
//                view.leftAnchor.constraint(equalTo: self.stack.leftAnchor),
//                view.rightAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
//            ])
//        }
    }
    
    private func setupStack(){
        stack.snp.makeConstraints { stack in
            stack.width.height.equalTo(contentView)
            stack.center.equalTo(contentView)
        }
    }
    
    private func setupButtons(){
        firstButton.snp.makeConstraints { button in
            button.height.equalTo(35)
            button.width.equalTo(100)
        }
        
//        secondButton.snp.makeConstraints { button in
//            button.left.equalTo(self.firstButton.snp.right).offset(8)
//            button.height.equalTo(35)
//        }
    }
    
}

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}

extension TestTableViewCell: Setupable {
    
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        self.firstButton.setTitle(viewModel.title, for: .normal)
//        self.secondButton.setTitle(viewModel.title, for: .normal)
    }
}
