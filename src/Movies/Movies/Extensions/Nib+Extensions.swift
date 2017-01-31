//
//  Nib+Extensions.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 15/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import Foundation

    //MARK: - UITableViewCell
extension MovieViewCell: NibLoadableView{}

    //MARK: - UICollectionViewCell
extension TitleCollectionViewCell: NibLoadableView{}
extension PlotCollectionViewCell: NibLoadableView{}
extension DescriptionViewCell: NibLoadableView{}
