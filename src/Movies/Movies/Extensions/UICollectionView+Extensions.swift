//
//  UICollectionView+Extensions.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 15/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

extension UICollectionViewCell: ReusableCell {}

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_:T.Type) where T: ReusableCell, T:NibLoadableView {
        register(UINib(nibName: T.nibName, bundle: nil), forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T:UICollectionViewCell>(forIndexPath indexPath: IndexPath)-> T where T: ReusableCell {
        
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
    
}
