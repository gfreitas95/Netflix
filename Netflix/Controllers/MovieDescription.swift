//
//  MovieDescription.swift
//  Netflix
//
//  Created by Gustavo on 25/08/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

class MovieDescription : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
//        movieDescription.text = movie
//        movieDescription.title = title
//        movieImage.image = UIImage(named: movie)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.addSubview(movieImage)
        view.addSubview(movieTitle)
        view.addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            movieImage.widthAnchor.constraint(equalToConstant: 500),
            movieImage.heightAnchor.constraint(equalToConstant: 400),
            movieImage.topAnchor.constraint(equalTo: view.topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            movieTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: -20),
            movieTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            movieTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5),
            movieTitle.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            movieDescription.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            movieDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            movieDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 30),
            movieDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - MovieDescriptionData
    
    var movie: CustomData? {
        didSet {
            guard let data = movie else { return }
            movieImage.image = data.image
        }
    }
    
    // MARK: - MoviesImageView
    
    let movieImage: UIImageView = {
     let movieImage = UIImageView()
     movieImage.image = UIImage(named: "movie_1")
     movieImage.clipsToBounds = true
     movieImage.contentMode = .scaleAspectFill
     movieImage.translatesAutoresizingMaskIntoConstraints = false
    return movieImage
    }()
    
    // MARK: - MovieTitle
    
    let movieTitle: UILabel = {
        let movieTitle = UILabel()
        movieTitle.text = "O IRLANDÊS"
        movieTitle.textColor = .red
        movieTitle.textAlignment = .left
        movieTitle.font = UIFont.boldSystemFont(ofSize: 40.0)
        movieTitle.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        movieTitle.translatesAutoresizingMaskIntoConstraints = false
       return movieTitle
    }()
    
    // MARK: - MoviesDescription
    
    let movieDescription: UILabel = {
        let movieDescription = UILabel()
        movieDescription.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        movieDescription.textColor = .white
        movieDescription.numberOfLines = 20
        movieDescription.textAlignment = .left
        movieDescription.lineBreakMode = .byWordWrapping
        movieDescription.font = UIFont.boldSystemFont(ofSize: 20.0)
        movieDescription.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        movieDescription.translatesAutoresizingMaskIntoConstraints = false
       return movieDescription
    }()
}
