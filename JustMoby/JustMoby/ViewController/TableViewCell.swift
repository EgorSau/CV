//
//  CategoryView.swift
//  JustMoby
//
//  Created by Egor SAUSHKIN on 23.12.2022.
//

import UIKit

final class TableViewCell: UITableViewCell {
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14)
        label.text = "See All"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        self.addSubview(self.horizontalStackView)
        horizontalStackView.addArrangedSubview(titleLabel)
        horizontalStackView.addArrangedSubview(descriptionLabel)
        
        let top = self.horizontalStackView.topAnchor.constraint(equalTo: self.topAnchor)
        let centerY = self.horizontalStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let left = self.horizontalStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8)
        let right = self.horizontalStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8)
        
        NSLayoutConstraint.activate([
                                    top,
                                    centerY,
                                    left,
                                    right
                                    ])
    }
    
    func setupWith(indexPath: IndexPath) {
        titleLabel.text = "Category-\(indexPath.section)"
    }
}
