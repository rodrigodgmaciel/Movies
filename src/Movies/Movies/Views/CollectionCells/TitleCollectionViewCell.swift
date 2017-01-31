//
//  TitleCollectionViewCell.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 30/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

class TitleCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        if titleLabel != nil {
            titleLabel.font = Constants.font_bold
            titleLabel.lineBreakMode = .byWordWrapping
            titleLabel.numberOfLines = 2
        }
    }

}
