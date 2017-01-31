//
//  MovieViewCell.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 15/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var subDiscriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        if discriptionLabel != nil {
            discriptionLabel.numberOfLines = 6
        }
        
        if imgView != nil {            
            imgView.contentMode = .scaleToFill
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
