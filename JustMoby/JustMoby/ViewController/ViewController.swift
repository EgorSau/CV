//
//  ViewController.swift
//  JustMoby
//
//  Created by Egor SAUSHKIN on 22.12.2022.
//

import UIKit

@available(iOS 13.0, *)
final class ViewController: UIViewController {
    
    private lazy var bannerView: UIView = {
        let view = BannersCollection()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "TableCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
    }
    
    private func setupView(){
        
        //MARK: View
        self.view.backgroundColor = .white
        self.title = "Home"
        
        //MARK: BannerConstraints
        self.view.addSubview(self.bannerView)
        let topBanner = self.bannerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor)
        let leadingBanner = self.bannerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8)
        let trailingBanner = self.bannerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8)
        let heightBanner = self.bannerView.heightAnchor.constraint(equalToConstant: 112)
        
        NSLayoutConstraint.activate([
                                    topBanner,
                                    leadingBanner,
                                    trailingBanner,
                                    heightBanner
                                    ])
        
        //MARK: TableConstraints
        self.view.addSubview(self.tableView)
        let topTable = self.tableView.topAnchor.constraint(equalTo: self.bannerView.bottomAnchor)
        let leadingTable = self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingTable = self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        let bottomTable = self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        NSLayoutConstraint.activate([
                                    topTable,
                                    leadingTable,
                                    trailingTable,
                                    bottomTable
                                    ])
    }
}

@available(iOS 13.0, *)
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? TableViewCell else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
            return cell
        }
        cell.setupWith(indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1...7:
            return CategoryCollection()
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1...7:
            return 112
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0...5:
            return 40
        default:
            return 0
        }
    }
}
