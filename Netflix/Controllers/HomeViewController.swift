//
//  ViewController.swift
//  Netflix
//
//  Created by Gustavo on 31/07/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

struct CustomData {
    
    var title: String
    var image: UIImage
}

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        navigationController()
    }
    
    func navigationController() {
        
        let titleImageView = UIImageView()
        titleImageView.image = UIImage(named: "logo")
        titleImageView.contentMode = .scaleAspectFit
        titleImageView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        navigationItem.titleView = titleImageView
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .black
    }
    
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "imageView")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    let previewSection: UILabel = {
        
        let preview = UILabel()
        preview.text = "Previews"
        preview.textColor = .white
        preview.font = UIFont.boldSystemFont(ofSize: 20.0)
        preview.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        preview.translatesAutoresizingMaskIntoConstraints = false
       return preview
    }()
    
    let data = [ CustomData(title: "movie_1", image: #imageLiteral(resourceName: "movie_1")),
                 CustomData(title: "movie_2", image: #imageLiteral(resourceName: "movie_2")),
                 CustomData(title: "movie_3", image: #imageLiteral(resourceName: "movie_3"))
    ]
    
    let collectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        return collectionView
    }()
    
    func setupLayout() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(imageView)
        view.addSubview(previewSection)
        view.addSubview(collectionView)
        
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -30).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        previewSection.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        previewSection.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        previewSection.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        collectionView.backgroundColor = .red
        collectionView.topAnchor.constraint(equalTo: previewSection.bottomAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5).isActive = true
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.data = self.data[indexPath.row]
        return cell
    }
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
        movieImage.image = #imageLiteral(resourceName: "movie_2")
        movieImage.clipsToBounds = true
        movieImage.layer.cornerRadius = 25
        movieImage.layer.masksToBounds = true
        movieImage.contentMode = .scaleAspectFill
        movieImage.translatesAutoresizingMaskIntoConstraints = false
       return movieImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(movieImage)
        movieImage.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        movieImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
