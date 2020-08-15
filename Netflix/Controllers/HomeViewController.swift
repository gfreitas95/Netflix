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
        tabBarViewController()
    }
    
    // MARK: - NavigationViewController
    
    func navigationController() {
        
        let logoButton = UIButton(type: .system)
//        logoButton.setImage(#imageLiteral(resourceName: "logo").withRenderingMode(.alwaysOriginal), for: .normal)
        logoButton.setTitle("logo", for: .normal)
        logoButton.setTitleColor(.white, for: .normal)
        logoButton.contentMode = .scaleAspectFit
        logoButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        let myListButton = UIButton(type: .system)
        myListButton.setTitle("My List", for: .normal)
        myListButton.setTitleColor(.white, for: .normal)
        myListButton.contentMode = .scaleAspectFit
        myListButton.frame = CGRect(x: 0, y: 0, width: 130, height: 150)
        
        let moviesButton = UIButton(type: .system)
        moviesButton.setTitle("Movies", for: .normal)
        moviesButton.setTitleColor(.white, for: .normal)
        moviesButton.contentMode = .scaleAspectFit
        moviesButton.frame = CGRect(x: 0, y: 0, width: 130, height: 150)
        
        let tvShowsButton = UIButton(type: .system)
        tvShowsButton.setTitle("Tv Shows", for: .normal)
        tvShowsButton.setTitleColor(.white, for: .normal)
        tvShowsButton.contentMode = .scaleAspectFit
        tvShowsButton.frame = CGRect(x: 0, y: 0, width: 130, height: 150)
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoButton)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: myListButton), UIBarButtonItem(customView: moviesButton), UIBarButtonItem(customView: tvShowsButton)]
    }
    
    // MARK: - Title Screen
    
    let imageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "irishman")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
    }()
    
    // MARK: - Sections
    
    let previewSection: UILabel = {
        
        let preview = UILabel()
        preview.text = "  Previews"
        preview.textColor = .white
        preview.font = UIFont.boldSystemFont(ofSize: 20.0)
        preview.font = UIFont(name:"HelveticaNeue-Bold", size: 20.0)
        preview.translatesAutoresizingMaskIntoConstraints = false
       return preview
    }()
    
    // MARK: - MoviesDictionary
    
    let data = [ CustomData(title: "movie_1", image: #imageLiteral(resourceName: "movie_1")),
                 CustomData(title: "movie_2", image: #imageLiteral(resourceName: "movie_2")),
                 CustomData(title: "movie_3", image: #imageLiteral(resourceName: "movie_3")),
                 CustomData(title: "movie_4", image: #imageLiteral(resourceName: "movie_7")),
                 CustomData(title: "movie_5", image: #imageLiteral(resourceName: "movie_18")),
                 CustomData(title: "movie_6", image: #imageLiteral(resourceName: "movie_22")),
                 CustomData(title: "movie_7", image: #imageLiteral(resourceName: "movie_20")),
                 CustomData(title: "movie_8", image: #imageLiteral(resourceName: "movie_16")),
                 CustomData(title: "movie_9", image: #imageLiteral(resourceName: "movie_15")),
                 CustomData(title: "movie_10", image: #imageLiteral(resourceName: "movie_12")),
                 CustomData(title: "movie_12", image: #imageLiteral(resourceName: "movie_19")),
                 CustomData(title: "movie_13", image: #imageLiteral(resourceName: "movie_21")),
                 CustomData(title: "movie_14", image: #imageLiteral(resourceName: "movie_8")),
                 CustomData(title: "movie_16", image: #imageLiteral(resourceName: "movie_4")),
                 CustomData(title: "movie_18", image: #imageLiteral(resourceName: "movie_14")),
                 CustomData(title: "movie_19", image: #imageLiteral(resourceName: "movie_15")),
                 CustomData(title: "movie_21", image: #imageLiteral(resourceName: "movie_18")),
                 CustomData(title: "movie_23", image: #imageLiteral(resourceName: "movie_17")),
    ]
    
    // MARK: - UICollectionViewController
    
    let collectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        return collectionView
    }()
    
    // MARK: - TabBarViewController
    
    func tabBarViewController() {
        
        let tabBar = UITabBarController()
        tabBar.tabBar.barTintColor = .black
        tabBar.tabBar.tintColor = .white
        
        let firstView = UIViewController()
        let secondView = UIViewController()
        let thirdView = UIViewController()
        let fourthView = UIViewController()
        let fifthView = UIViewController()
        
        let firstItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        let secondItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        let thirdItem = UITabBarItem(tabBarSystemItem: .history, tag: 2)
        let fourthItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 3)
        let fifthItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 4)
        
        firstView.tabBarItem = firstItem
        secondView.tabBarItem = secondItem
        thirdView.tabBarItem = thirdItem
        fourthView.tabBarItem = fourthItem
        fifthView.tabBarItem = fifthItem
        
        tabBar.viewControllers = [firstView, secondView, thirdView, fourthView, fifthView]
        
        view.addSubview(tabBar.view)
    }
    
    // MARK: - Custom Layout Controller
    
    func setupLayout() {
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .black
        
        view.addSubview(imageView)
        view.addSubview(previewSection)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: -30),
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        previewSection.topAnchor.constraint(equalTo: imageView.bottomAnchor),
        previewSection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        previewSection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        
        collectionView.topAnchor.constraint(equalTo: previewSection.bottomAnchor, constant: 20),
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5)
        ])
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
        movieImage.layer.cornerRadius = 0.5
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
