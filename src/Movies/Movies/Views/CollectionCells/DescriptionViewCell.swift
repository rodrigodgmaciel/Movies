//
//  DescriptionViewCell.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 30/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

class DescriptionViewCell: UICollectionViewCell {

    @IBOutlet weak var actorsLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if actorsLabel != nil {
            
            actorsLabel.lineBreakMode = .byWordWrapping
            actorsLabel.numberOfLines = 0
        }
    }

}
