//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 20.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var headerView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var postView: ProfileTableHeaderView = {
        let postView = ProfileTableHeaderView()
        postView.delegate = self
        postView.translatesAutoresizingMaskIntoConstraints = false
        return postView
    }()
    
    private lazy var photoView: PhotoTableHeaderView = {
        let photoView = PhotoTableHeaderView()
        photoView.delegate = self
        photoView.view.translatesAutoresizingMaskIntoConstraints = false
        return photoView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupSubView()
    }
    
    private func setupView(){
        self.view.backgroundColor = .white
        self.navigationItem.title = "Profile"
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupSubView(){
        
        self.view.addSubview(self.headerView)
        self.view.addSubview(self.photoView.view)
        self.view.addSubview(self.postView)
        
        //настройка профиля
        let topConstraint = self.headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingConstraint = self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let heightConstraint = self.headerView.heightAnchor.constraint(equalToConstant: 290)
        
        //настройка фото
        let topPhotoConstraint = self.photoView.view.topAnchor.constraint(equalTo: self.headerView.bottomAnchor)
        let leadingPhotoConstraint = self.photoView.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingPhotoConstraint = self.photoView.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let heightPhotoConstraint = self.photoView.view.heightAnchor.constraint(equalToConstant: 150)
        
        //настройка таблицы
        let topTableConstraint = self.postView.topAnchor.constraint(equalTo: self.photoView.view.bottomAnchor)
        let leadingTableConstraint = self.postView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingTableConstraint = self.postView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomTableConstraint = self.postView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        
        NSLayoutConstraint.activate([
                                    topConstraint,
                                    leadingConstraint,
                                    trailingConstraint,
                                    heightConstraint,
                                    topTableConstraint,
                                    leadingTableConstraint,
                                    trailingTableConstraint,
                                    bottomTableConstraint,
                                    topPhotoConstraint,
                                    leadingPhotoConstraint,
                                    trailingPhotoConstraint,
                                    heightPhotoConstraint
                                    ])
    }
}
