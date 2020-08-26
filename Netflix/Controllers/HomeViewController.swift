//
//  ViewController.swift
//  Netflix
//
//  Created by Gustavo on 31/07/20.
//  Copyright © 2020 Gustavo. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController()
        tabBarViewController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(backgroundImage)
        view.addSubview(previewSection)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            backgroundImage.widthAnchor.constraint(equalToConstant: 400),
            backgroundImage.heightAnchor.constraint(equalToConstant: 550),
            
            previewSection.topAnchor.constraint(equalTo: backgroundImage.bottomAnchor, constant: 20),
            previewSection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            previewSection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: previewSection.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor, multiplier: 0.5)
        ])
    }
    
    // MARK: - NavigationViewController
    
    func navigationController() {
        
        let logoButton = UIButton(type: .system)
        logoButton.setImage(#imageLiteral(resourceName: "logo").withRenderingMode(.alwaysOriginal), for: .normal)
        logoButton.contentMode = .scaleAspectFit
        logoButton.translatesAutoresizingMaskIntoConstraints = false
        logoButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        logoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        let myListButton = UIButton(type: .system)
        myListButton.setTitle("My List", for: .normal)
        myListButton.setTitleColor(.white, for: .normal)
        myListButton.contentMode = .scaleAspectFit
        myListButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        let moviesButton = UIButton(type: .system)
        moviesButton.setTitle("Movies", for: .normal)
        moviesButton.setTitleColor(.white, for: .normal)
        moviesButton.contentMode = .scaleAspectFit
        moviesButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        let tvShowsButton = UIButton(type: .system)
        tvShowsButton.setTitle("Tv Shows", for: .normal)
        tvShowsButton.setTitleColor(.white, for: .normal)
        tvShowsButton.contentMode = .scaleAspectFit
        tvShowsButton.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .clear
        navigationController?.navigationBar.prefersLargeTitles = true
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: logoButton)
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: myListButton),
                                              UIBarButtonItem(customView: moviesButton), UIBarButtonItem(customView: tvShowsButton)]
    }
    
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
    
    // MARK: - BackgroundImage
    
    let backgroundImage: UIImageView = {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "1")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
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
    
    let data = [CustomData(image: #imageLiteral(resourceName: "movie_2")), CustomData(image: #imageLiteral(resourceName: "movie_1")), CustomData(image: #imageLiteral(resourceName: "movie_3")), CustomData(image: #imageLiteral(resourceName: "movie_19")), CustomData(image: #imageLiteral(resourceName: "movie_21")), CustomData(image: #imageLiteral(resourceName: "movie_18")), CustomData(image: #imageLiteral(resourceName: "movie_20")), CustomData(image: #imageLiteral(resourceName: "movie_14")), CustomData(image: #imageLiteral(resourceName: "movie_16")), CustomData(image: #imageLiteral(resourceName: "1"))]
    
    let movie = ["movie_1", "movie_2", "movie_3", "movie_4", "movie_5", "movie_6", "movie_7", "movie_8", "movie_9", "movie_10",]
    
    // MARK: - UICollectionViewController
    
    let collectionView: UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.height - 20, height: collectionView.frame.height - 20)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.data = self.data[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 
        let movieDescription = MovieDescription()
        movieDescription.movie = data[indexPath.row]
        self.navigationController?.pushViewController(movieDescription, animated: true)
    }
}
