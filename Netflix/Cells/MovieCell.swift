//
//  MovieCell.swift
//  Netflix
//
//  Created by Gustavo on 12/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

class movieCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupConstrainst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "movie_1")
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 200
        imageView.layer.masksToBounds = true
        
       return imageView
    }()
    
    func setupConstrainst() {
        
        addSubview(imageView)
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
}
