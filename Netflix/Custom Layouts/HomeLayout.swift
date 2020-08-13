//
//  CustomLayouts.swift
//  Netflix
//
//  Created by Gustavo on 12/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

extension HomeViewController {
    
    func setupInitializer() {
        collectionView?.backgroundColor = .black
        self.collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    func setupNavigationBarItens() {
        
        let titleImageView = UIImageView()
        titleImageView.image = UIImage(named: "logo")
        titleImageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        titleImageView.contentMode = .scaleAspectFit
        
        let menuButton = UIButton(type: .system)
        menuButton.setImage(.actions, for: .normal)
        menuButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let searchButton = UIButton(type: .system)
        searchButton.setImage(.add, for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.titleView = titleImageView
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: searchButton)
        navigationController?.navigationBar.backgroundColor = .black
        navigationController?.navigationBar.isTranslucent = false
    }
}
