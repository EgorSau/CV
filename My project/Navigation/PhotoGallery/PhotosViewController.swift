//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 17.03.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private var isExpanded = false
    private let exitTapGestureRecognizer = UITapGestureRecognizer()
    
    var images = [String]()
    
    var topConstraint: NSLayoutConstraint?
    var leftConstraint: NSLayoutConstraint?
    var rightConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    
    private lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isHidden = true
        imageView.alpha = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "GalleryCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.viewSetup()
        self.imageSetup()
        self.exitSetup()
        self.setupGesture()
    }
    
    private func viewSetup(){
        self.view.backgroundColor = .white
    }
    
    private func imageSetup(){
        self.view.addSubview(imageView)

        //Constraints
        let top = self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height/4)
        let right = self.imageView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let left = self.imageView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let imageViewAspectRatio = self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor, multiplier: 1.0)

        NSLayoutConstraint.activate([
                                    top,
                                    imageViewAspectRatio,
                                    right,
                                    left
                                    ])
    }
    
    func setupCollectionView(){
        self.navigationItem.title = "Photo Gallery"
        self.navigationController?.navigationBar.isHidden = false // for PhotosCollectionViewCell.swift
        self.view.addSubview(self.collectionView)
        
        self.topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
        self.leftConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        self.rightConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        self.bottomConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
            self.topConstraint, self.leftConstraint, self.rightConstraint, self.bottomConstraint
        ].compactMap({$0}))
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
    
    func imageZoom(forCell: IndexPath){
        let image = self.images[forCell.row]
        self.imageView.image = UIImage(named: image)

        UIView.animate(withDuration: 0.5, delay: 0.0) {
            
            
            self.imageView.isHidden = false
            self.imageView.alpha = 1
            self.topConstraint?.isActive = false
            self.leftConstraint?.isActive = false
            self.rightConstraint?.isActive = false
            self.bottomConstraint?.isActive = false
            
            self.exitImageView.isHidden = false
            self.exitImageView.alpha = 1
            self.view.layoutIfNeeded()
        }
    }
    
    func viewChange(to: Bool, show: UICollectionViewCell) {
        if to == true {

            print("hello! \(show)")
            show.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
            print("hello2! \(show)")
            self.exitImageView.isHidden = false
            
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.exitImageView.alpha = 1

                self.topConstraint?.isActive = false
                self.leftConstraint?.isActive = false
                self.rightConstraint?.isActive = false
                self.bottomConstraint?.isActive = false
            
                self.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
                self.view.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor).isActive = true
                self.view.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor).isActive = true
                self.view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true

                self.view = show
                
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func setupGesture(){
        self.exitImageView.addGestureRecognizer(self.exitTapGestureRecognizer)
        self.exitTapGestureRecognizer.addTarget(self, action: #selector(self.exitHandleTapGesture))
    }
    
    @objc private func exitHandleTapGesture(_ gestureRecognizer: UITapGestureRecognizer){
        guard self.exitTapGestureRecognizer === gestureRecognizer else { return }
        
        self.isExpanded.toggle()
        if self.isExpanded {
            
            UIView.animate(withDuration: 0.5, delay: 0.0) {
                self.imageView.alpha = 0
                self.exitImageView.alpha = 0
                self.topConstraint?.isActive = true
                self.leftConstraint?.isActive = true
                self.rightConstraint?.isActive = true
                self.bottomConstraint?.isActive = true
                self.view.layoutIfNeeded()
            }
        }
    }
}
