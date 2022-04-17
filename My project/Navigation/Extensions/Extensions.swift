//
//  Extensions.swift
//  Navigation
//
//  Created by Egor SAUSHKIN on 11.03.2022.
//

import UIKit

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}

extension ProfileTableHeaderView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let view = ProfileTableHeaderView()
        let count = view.dataSource.count
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        
        let post = self.dataSource[indexPath.row]
        let viewModel = PostTableViewCell.ViewModel(author: post.author,
                                                    description: post.description,
                                                    image: post.image,
                                                    likes: post.likes,
                                                    views: post.views)
        cell.setup(with: viewModel)
        cell.viewsUpdate(with: cell.views, forIndex: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostTableViewCell else {return}
        cell.setupGesture()
        self.delegate?.goToPostDetails(index: indexPath)
    }
}

extension PostTableViewCell: Setupable {
    
    func setup(with viewModel: ViewModelProtocol) {
        guard let viewModel = viewModel as? ViewModel else { return }
        
        self.titleLabel.text = viewModel.author
        self.postImage.image = UIImage(named: viewModel.image)
        self.postLabel.text = viewModel.description
        self.likesLabel.text = "Likes: \(viewModel.likes)"
        self.viewsLabel.text = "Views: \(viewModel.views)"
        
        self.views = viewModel.views
    }
}

extension PhotoTableHeaderView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as? PhotosTableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        cell.changeToString()
        cell.uploadImages()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.goToPhotoGallery()
    }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        cell.backgroundColor = .systemPink
        self.images = cell.uploadPhotos(for: indexPath)
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

extension ProfileViewController: GalleryPushDelegateProtocol {
    func goToPhotoGallery() {
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }
}

extension ProfileViewController: PostDetailsPushDelegateProtocol {
    func goToPostDetails(index: IndexPath) {
        let postDetails = PostDetailsViewController()
        present(postDetails, animated: true, completion: .none)
        let view = self.postView.tableView.cellForRow(at: index)
        postDetails.view = view
    }
}

extension PostTableViewCell {
    
    func setupGesture() {
        self.likesLabel.addGestureRecognizer(self.likesLabelTapGestureRecognizer)
        self.likesLabelTapGestureRecognizer.addTarget(self, action: #selector(self.likesLabelHandleTapGesture))
    }
    
    @objc private func likesLabelHandleTapGesture(_ gestureRecognizer: UITapGestureRecognizer) {
        guard self.likesLabelTapGestureRecognizer === gestureRecognizer else { return }
        
        var currentLikes: Int = 0

        while currentLikes == 0 {
            var tempText = self.likesLabel.text
            let first = tempText?.popLast()?.wholeNumberValue
            let second = tempText?.popLast()?.wholeNumberValue
            let third = tempText?.popLast()?.wholeNumberValue
            guard let first = first else {return}
            guard let second = second else {return}
            guard let third = third else {return}
            currentLikes += first + second * 10 + third * 100
        }
    
        let newLikes = currentLikes
        let newText = "Likes: \(newLikes + gestureRecognizer.numberOfTouches)"
        self.likesLabel.text = newText
    }
    
    func viewsUpdate(with number: Int, forIndex: IndexPath){
        if self.isSelected == false {
            self.counter += 1
        }
        let newText = "Views: \(number + self.counter)"
        self.viewsLabel.text = newText
    }
}
