//
//  PlotCollectionViewCell.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 30/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

class PlotCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var plotLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if plotLabel != nil {
            
            plotLabel.font = Constants.font_regular
            plotLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            plotLabel.numberOfLines = 0
        }
    }

}
