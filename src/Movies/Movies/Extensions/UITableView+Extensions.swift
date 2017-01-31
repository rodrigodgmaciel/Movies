//
//  UITableView+Extensions.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 15/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

extension UITableViewCell: ReusableCell {}

extension UITableView {
    
    func register<T: UITableViewCell>(_:T.Type) where T: ReusableCell, T:NibLoadableView {
        register(UINib(nibName: T.nibName, bundle: nil), forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T:UITableViewCell>(forIndexPath indexPath: IndexPath)-> T where T: ReusableCell {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        return cell
    }
    
    func hideEmptyCells() {
        self.tableFooterView = UIView(frame: .zero)
    }
}
