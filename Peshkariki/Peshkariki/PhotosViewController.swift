//
//  PhotosViewController.swift
//  Peshkariki
//
//  Created by Egor SAUSHKIN on 04.05.2022.
//

import UIKit
import Alamofire

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}

class PhotosViewController: UIViewController {
    
    var numberOfSections = 1
    var nameForVarButtonItem = "magnifyingglass"
    
    var isExpanded = false
    let exitTapGestureRecognizer = UITapGestureRecognizer()
    
    var images = [UIImage]()
    
    var topConstraint: NSLayoutConstraint?
    var leftConstraint: NSLayoutConstraint?
    var rightConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    
    struct ViewModel: ViewModelProtocol {
        let author: String
        let creationDate: String
        let location: String
    }
    
    private lazy var textField: UITextField = {
        var textField = UITextField()
        textField.backgroundColor = .systemGray2
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.isHidden = true
        textField.alpha = 0
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var photoLabel: UILabel = {
        var photoLabel = UILabel()
        photoLabel.isHidden = true
        photoLabel.backgroundColor = .systemPink
        photoLabel.alpha = 0
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        return photoLabel
    }()
    
    private lazy var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.isHidden = true
        imageView.alpha = 0
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        self.viewSetup()
        self.imageSetup()
        self.exitSetup()
        self.setupGesture()
        self.setupTextField()
        self.photoLabelSetup()
    }
    
    private func viewSetup(){
        self.view.backgroundColor = .white
    }
    
    private func setupTextField(){
        self.view.addSubview(textField)
        
        let top = self.textField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -40)
        let right = self.textField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -50)
        let left = self.textField.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 8)
        let height = self.textField.heightAnchor.constraint(equalToConstant: 40)
        let width = self.textField.widthAnchor.constraint(equalToConstant: 400)
        
        NSLayoutConstraint.activate([top,
                                     right,
                                     left,
                                     height,
                                     width
                                    ])
    }
    
    private func setupCollectionView(){
        self.navigationItem.title = "Photo Gallery"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: self.nameForVarButtonItem),
                                                                 style: .plain,
                                                                 target: self,
                                                                 action: #selector(searchAppearance))
        self.navigationController?.navigationBar.isHidden = false
        self.view.addSubview(self.collectionView)
        
        self.topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
        self.leftConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        self.rightConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        self.bottomConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
                                    self.topConstraint,
                                    self.leftConstraint,
                                    self.rightConstraint,
                                    self.bottomConstraint
                                    ].compactMap({$0}))
    }
    
    private func imageSetup(){
        self.view.addSubview(imageView)

        let top = self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.frame.height/6)
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
    
    private func photoLabelSetup(){
        self.view.addSubview(photoLabel)

        let top = self.photoLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor, constant: 20)
        let right = self.photoLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let left = self.photoLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor)

        NSLayoutConstraint.activate([
                                    top,
                                    right,
                                    left
                                    ])
    }
    
    private func exitSetup(){
        self.view.addSubview(exitImageView)
        
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
    
    private func urlRequest(completion: @escaping ([UIImage]) -> Void) {
        let url = "https://api.unsplash.com/photos/?client_id=xOZhFXxLD9YKp4qiq7SaLlJzLLs8nHrTCdUtOOQlmAc"
        AF.request(url).responseDecodable(of: [Pictures].self) { response in
            guard let value = response.value else { return }
            var imagesArray = [UIImage]()
            for each in value {
                guard let pictureName = each.urls.small else { return }
                guard let url = URL(string: pictureName)
                else {
                    print("Unable to create URL")
                    return
                }
                do {
                    let data = try Data(contentsOf: url, options: [])
                    guard let image = UIImage(data: data) else { return }
                    imagesArray.append(image)
                }
                catch {
                    print(error.localizedDescription)
                }
            }
//            self.numberOfSections = picturesArray.count
            self.images = imagesArray
            completion(imagesArray)
        }
    }
    
    func imageZoom(forCell: IndexPath){
        self.imageView.image = self.images[forCell.row]

        UIView.animate(withDuration: 0.5, delay: 0.0) {
            
            self.imageView.isHidden = false
            self.imageView.alpha = 1
            self.photoLabel.isHidden = false
            self.photoLabel.alpha = 1
            self.topConstraint?.isActive = false
            self.leftConstraint?.isActive = false
            self.rightConstraint?.isActive = false
            self.bottomConstraint?.isActive = false
            
            self.exitImageView.isHidden = false
            self.exitImageView.alpha = 1
            self.view.layoutIfNeeded()
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
    
    @objc private func searchAppearance(){
        UIView.animate(withDuration: 0.5, delay: 0.0) {
            self.nameForVarButtonItem = "xmark"
            self.navigationItem.title = ""
            self.textField.isHidden = false
            self.textField.alpha = 1.0
            self.imageView.isHidden = false
            self.imageView.alpha = 1.0
            self.view.layoutIfNeeded()
        }
    }
    
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //надо проверить сколько тут всего ячеек array.count
        return 10
//        return self.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        cell.backgroundColor = .systemPink
        self.urlRequest { Pictures in
            cell.photoImage.image = Pictures[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing
        let collection = PhotosCollectionViewCell()
        return collection.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let _ = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as? PhotosCollectionViewCell else {return}
        self.imageZoom(forCell: indexPath)
    }
}


extension PhotosViewController: Setupable {
    
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        //MARK: To check how to make text from next line
        self.photoLabel.text = viewModel.author
        self.photoLabel.text = viewModel.creationDate
        self.photoLabel.text = viewModel.location
    }
}
