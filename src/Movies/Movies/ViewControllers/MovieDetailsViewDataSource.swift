//
//  MovieDetailsViewDataSource.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 30/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

class MovieDetailsViewDataSource: NSObject {
    
    var viewController: MovieDetailsViewController!

}

    //MARK: - UICollectionViewDataSource
extension MovieDetailsViewDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
        case 0: return titleCell(collectionView, atIndexPath: indexPath)
        case 1: return plotCell(collectionView, atIndexPath: indexPath)
        default: return description(collectionView, atIndexPath: indexPath)
        }
    }
    
    func titleCell(_ collectionView: UICollectionView, atIndexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(forIndexPath: atIndexPath) as TitleCollectionViewCell
        
        if let movie = self.viewController.movie {
            cell.titleLabel.text = movie.titleText
        }
        
        return cell
    }
    
    func plotCell(_ collectionView: UICollectionView, atIndexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(forIndexPath: atIndexPath) as PlotCollectionViewCell
        
        if let plot = self.viewController.movie?.plot {
            cell.plotLabel.text = plot
            cell.plotLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            cell.plotLabel.numberOfLines = 0
        }
        return cell
    }
    
    func description(_ collectionView: UICollectionView, atIndexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(forIndexPath: atIndexPath) as DescriptionViewCell
        
        if let actors = self.viewController.movie?.actors{
             cell.actorsLabel.text = "Actors: \(actors)"
        }
        if let director = self.viewController.movie?.director {
            cell.directorLabel.text = "Director: \(director)"
        }
        if let genre = self.viewController.movie?.genre {
            cell.genreLabel.text = "Genre: \(genre)"
        }
        if let runtime = self.viewController.movie?.runtime {
            cell.runtimeLabel.text = "Runtime: \(runtime)"
        }
       
        return cell
    }
}

    //MARK: - UICollectionViewDelegate
extension MovieDetailsViewDataSource: UICollectionViewDelegate {
    
}


    //MARK: - SizeForCell
extension MovieDetailsViewDataSource {
    
    func sizeForCell(atIndex indexPath: IndexPath, collectionViewWidth : CGFloat) -> CGSize {
        
        switch indexPath.row {
        case 0: return CGSize(width: collectionViewWidth, height: 50)
        case 1: return sizeForCellPlot( collectionViewWidth: collectionViewWidth)
        default: return CGSize(width: collectionViewWidth, height: 250)
        }
    }
    
    func sizeForCellPlot(collectionViewWidth : CGFloat) -> CGSize {
        
        if let plot = self.viewController.movie?.plot {
            let value = LabelHelper.heightForView(plot, font: Constants.font_regular!, width: collectionViewWidth)
            
            return CGSize(width: collectionViewWidth, height: value + 20)
        }
        
        return CGSize(width: collectionViewWidth, height: 25)
    }
}


