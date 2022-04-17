//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 12.03.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let likesLabelTapGestureRecognizer = UITapGestureRecognizer()
    
    struct ViewModel: ViewModelProtocol {
        let author: String
        let description: String
        let image: String
        var likes: Int
        var views: Int
    }
    
    var views: Int = 0
    var counter: Int = 0
    
    private lazy var backView: UIView = {
       let backView = UIView()
        backView.clipsToBounds = true
        backView.translatesAutoresizingMaskIntoConstraints = false
        return backView
    }()
    
    private lazy var postStack: UIStackView = {
        let postStack = UIStackView()
        postStack.axis = .vertical
        postStack.spacing = 16
        postStack.translatesAutoresizingMaskIntoConstraints = false
        return postStack
    }()
    
    private lazy var likesStack: UIStackView = {
        let likesStack = UIStackView()
        likesStack.axis = .horizontal
        likesStack.translatesAutoresizingMaskIntoConstraints = false
        return likesStack
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 2
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var postLabel: UILabel = {
        let postLabel = UILabel()
        postLabel.font = .systemFont(ofSize: 14, weight: .regular)
        postLabel.textColor = .systemGray
        postLabel.numberOfLines = 0
        postLabel.translatesAutoresizingMaskIntoConstraints = false
        return postLabel
    }()
    
    lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.font = .systemFont(ofSize: 16, weight: .regular)
        likesLabel.textColor = .black
        likesLabel.textAlignment = .left
        likesLabel.isUserInteractionEnabled = true
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesLabel
    }()
    
    lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.font = .systemFont(ofSize: 16, weight: .regular)
        viewsLabel.textColor = .black
        viewsLabel.textAlignment = .right
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()
    
    lazy var postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.contentMode = .scaleAspectFit
        postImage.backgroundColor = .black
        postImage.translatesAutoresizingMaskIntoConstraints = false
        return postImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
        self.setupStack()
        self.setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.viewsLabel.text = nil
        self.likesLabel.text = nil
    }
    
    private func setupView(){
        
        self.contentView.addSubview(backView)
        
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        let trailingConstraint = self.backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        let bottomConstraint = self.backView.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor)
    
        NSLayoutConstraint.activate([topConstraint,
                                     leadingConstraint,
                                     trailingConstraint,
                                     bottomConstraint
                                    ])
    }
   
    private func setupStack(){
        self.backView.addSubview(postStack)
        self.postStack.addArrangedSubview(titleLabel)
        self.postStack.addArrangedSubview(postImage)
        self.postStack.addArrangedSubview(postLabel)
        self.postStack.addArrangedSubview(likesStack)
        self.likesStack.addArrangedSubview(likesLabel)
        self.likesStack.addArrangedSubview(viewsLabel)
        
        // констрейнт картинки
        let heightPostImageConstraint = self.postImage.heightAnchor.constraint(equalToConstant: 400)
        
        // констрейнт тайтл-лейбла
        let leadingTitleLabelConstraint = self.titleLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        
        // констрейнт пост-лейбла
        let leadingPostLabelConstraint = self.postLabel.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        
        // констрейнт картинки
        let leadingImageConstraint = self.postImage.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        
        // констрейнт лайк-стека
        let bottomLikeStackConstraint = self.likesStack.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor, constant: -16)

        // констрейнт стэка
        let topPostStackConstraint = self.postStack.topAnchor.constraint(equalTo: self.backView.topAnchor, constant: 16)
        let trailingPostStackConstraint = self.postStack.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)

        NSLayoutConstraint.activate([
                                    topPostStackConstraint,
                                    trailingPostStackConstraint,
                                    heightPostImageConstraint,
                                    leadingTitleLabelConstraint,
                                    leadingPostLabelConstraint,
                                    leadingImageConstraint,
                                    bottomLikeStackConstraint
                                    ])
    }
}
