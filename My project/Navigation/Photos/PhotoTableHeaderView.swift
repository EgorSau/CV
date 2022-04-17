//
//  PhotoTableHeaderView.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 17.03.2022.
//

import UIKit

protocol GalleryPushDelegateProtocol: AnyObject {
    func goToPhotoGallery()
}

class PhotoTableHeaderView: UIViewController{
    
    weak var delegate: GalleryPushDelegateProtocol?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.drawSelf()
    }
    
    private func drawSelf() {
        self.setupTableView()
    }
    
    private func setupTableView() {
        
        self.view.addSubview(self.tableView)
        
        let topConstraint = self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leadingConstraint = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomConstraint = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([topConstraint,
                                     leadingConstraint,
                                     trailingConstraint,
                                     bottomConstraint
                                    ])
    }
}
