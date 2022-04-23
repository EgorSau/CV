//
//  ViewController.swift
//  Test task
//
//  Created by Egor SAUSHKIN on 01.04.2022.
//

import UIKit
import Alamofire
import SnapKit

class ViewController: UIViewController {
    
    private lazy var jsonDecoder: JSONDecoder = {
        return JSONDecoder()
    }()
    
//    private enum Constants {
//        static let itemCount: CGFloat = 6
//        static let spacing: CGFloat = 8
//    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        return layout
    }()
    
    private lazy var collection: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collection.backgroundColor = . white
        collection.delegate = self
        collection.dataSource = self
        collection.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        collection.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        return collection
    }()
    
    var url = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Non_Alcoholic"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSetup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
        
    private func urlRequest(completion: @escaping ([String]) -> Void) {
        AF.request(self.url).responseDecodable(of: Root.self) { response in
            guard let value = response.value else { return }
            let result = value.drinks
//            completion(result)
            //transfer to String
            var tempArray: [String] = []
            for each in result {
                guard let drinkName = each.strDrink else { return }
                tempArray.append(drinkName)
            }
            completion(tempArray)
        }
    }
    
    private func viewSetup() {
        self.view.backgroundColor = .black
        self.view.addSubview(collection)

        collection.snp.makeConstraints { make -> Void in
            make.width.height.equalTo(self.view)
            make.center.equalTo(self.view)
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 58
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            cell.backgroundColor = .systemRed
            return cell
        }
        self.urlRequest { drinks in
            cell.button.setTitle(drinks[indexPath.row], for: .normal)
            }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 35)
    }
}
