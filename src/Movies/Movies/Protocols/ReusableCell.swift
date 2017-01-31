//
//  ReusableCell.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 15/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

protocol ReusableCell: class {}

extension ReusableCell where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
