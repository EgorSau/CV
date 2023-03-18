//
//  SecondTableViewCell.swift
//  JustMoby
//
//  Created by Egor SAUSHKIN on 22.12.2022.
//

import UIKit

final class CategoryCollection: UIView {
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(CategoryCollectionCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
      
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(){
        self.addSubview(self.collectionView)
        
        let topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.topAnchor)
        let leftConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor)
        let rightConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        let height = self.collectionView.heightAnchor.constraint(equalToConstant: 112)
        
        NSLayoutConstraint.activate([
                                    topConstraint,
                                    leftConstraint,
                                    rightConstraint,
                                    height
                                    ])
    }
}

extension CategoryCollection: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as? CategoryCollectionCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        cell.uploadPhotos()
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10
        cell.contentMode = .scaleAspectFit
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3-2*8, height: 112)
    }
}
