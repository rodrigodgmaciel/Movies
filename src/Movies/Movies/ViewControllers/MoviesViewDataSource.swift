//
//  MoviesViewDataSource.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 15/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

class MoviesViewDataSource: NSObject {
    
    var moviesViewController: MoviesViewController!

}
    //MARK: - UITableViewDataSource
extension MoviesViewDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.moviesViewController.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as MovieViewCell
        
      
            let movie = self.moviesViewController.movies[indexPath.row]
            cell.titleLabel.text = movie.titleText
            cell.discriptionLabel.text = movie.plot
            cell.subDiscriptionLabel.text = movie.genre
            cell.imgView.image = nil
            
            if let url = movie.poster {
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: url)
                    DispatchQueue.main.async {
                        if let data = data {
                            cell.imgView.image = UIImage(data: data)
                        }
                    }
                }
            }
       
        return cell
    }
}
    //MARK: - UITableViewDelegate
extension MoviesViewDataSource: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.moviesViewController.performSegue(withIdentifier: "MovieDetailsViewController", sender: nil)

    }
}
