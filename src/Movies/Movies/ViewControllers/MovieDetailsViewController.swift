//
//  MovieDetailsViewController.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 30/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var collectionViewDataSource: MovieDetailsViewDataSource!
    
    var movie: MovieViewModel?
    
}

    //MARK: - LifeCycle
extension MovieDetailsViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCollectionView()
        
        self.title = "Movie"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.collectionView.collectionViewLayout.invalidateLayout()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

    //MARK: - Setup
extension MovieDetailsViewController: CollectionViewLayoutDelegate {
    
    func setupCollectionView() {
        if let layout = collectionView?.collectionViewLayout as? CollectionViewLayout {
            layout.delegate = self
        }
       
        self.collectionView.register(TitleCollectionViewCell.self)
        self.collectionView.register(PlotCollectionViewCell.self)
        self.collectionView.register(DescriptionViewCell.self)
            
        self.collectionViewDataSource = MovieDetailsViewDataSource()
        self.collectionViewDataSource.viewController = self
        self.collectionView.dataSource = self.collectionViewDataSource
        self.collectionView.backgroundColor = Constants.colorDefault

        
    }
    
    func heightForItemAtIndexPath(_ indexPath: IndexPath, withWidth:CGFloat) -> CGFloat {
        return self.collectionViewDataSource.sizeForCell(atIndex: indexPath, collectionViewWidth: withWidth).height
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        self.collectionView.collectionViewLayout.invalidateLayout()
        self.collectionView.reloadData()
    }
}
