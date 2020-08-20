//
//  MovieCell.swift
//  Netflix
//
//  Created by Gustavo on 19/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

struct CustomData {
    
    var image: UIImage
}

class MovieCell: UICollectionViewCell {
    
    var data: CustomData? {
        didSet {
            guard let data = data else { return }
            movieImage.image = data.image
        }
    }
    
    let movieImage: UIImageView = {
        let movieImage = UIImageView()
        movieImage.image = UIImage(named: "movie_1")
        movieImage.clipsToBounds = true
        movieImage.contentMode = .scaleAspectFill
        movieImage.translatesAutoresizingMaskIntoConstraints = false
       return movieImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(movieImage)
        
        NSLayoutConstraint.activate([
        movieImage.topAnchor.constraint(equalTo: contentView.topAnchor),
        movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        movieImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
