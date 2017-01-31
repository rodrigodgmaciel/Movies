//
//  CollectionViewLayout.swift
//  Movies
//
//  Created by Rodrigo Damacena Gamarra Maciel on 30/01/17.
//  Copyright © 2017 Rodrigo Damacena Gamarra Maciel. All rights reserved.
//

import UIKit

protocol CollectionViewLayoutDelegate {
    func heightForItemAtIndexPath(_ indexPath: IndexPath, withWidth:CGFloat) -> CGFloat
}

class CollectionViewLayout: UICollectionViewLayout {

    var delegate: CollectionViewLayoutDelegate!
    
    fileprivate var attributesCache = [UICollectionViewLayoutAttributes]()
    
    fileprivate var contentHeight: CGFloat  = 0.0
    fileprivate var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
    }
    
    override func prepare() {
        
        let numberOfColumns = columnsBasedOnScreen()
        attributesCache = []
        contentHeight = 0.0
        
        // Initializes offsets arrays
        let columnWidth = contentWidth / CGFloat(numberOfColumns)
        var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
        
        var xOffset = [CGFloat]()
        for column in 0 ..< numberOfColumns {
            xOffset.append(CGFloat(column) * columnWidth)
        }
        
        var column = 0
        
        for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
            
            // Calculates cell frame
            let indexPath = IndexPath(item: item, section: 0)
            let itemHeight = delegate.heightForItemAtIndexPath(indexPath, withWidth: columnWidth)
            
            var frame: CGRect
            if item == 0 {
                // if first cell, cell width == content width
                frame = CGRect(x: xOffset[column], y: yOffset[column], width: contentWidth, height: itemHeight)
            } else {
                // cell width == column width
                frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: itemHeight)
            }
            
            // Append cell attributes to cache
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = frame
            attributesCache.append(attributes)
            
            // Updates contentHeight
            contentHeight = max(contentHeight, frame.maxY)
            
            // Updates y position of next cell
            if item == 0 {
                for i in 0..<yOffset.count {
                    yOffset[i] = itemHeight
                }
            } else {
                yOffset[column] = yOffset[column] + itemHeight
            }
            
            // Determines column where next cell will be placed
            if item == 0 {
                column = 0
            } else {
                column = column + 1     //convertido para swift 3
                let otherColumn = Int(column)
                column = column >= (numberOfColumns - 1) ? 0 : otherColumn
            }
            
        }
    }
    
    override var collectionViewContentSize : CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        
        let sectionsCount = self.collectionView!.dataSource!.numberOfSections!(in: self.collectionView!)
        for section in 0..<sectionsCount {
            layoutAttributes.append(self.layoutAttributesForSupplementaryView(ofKind: UICollectionElementKindSectionHeader, at: IndexPath(item: 1, section: section))!)
        }
        
        for attributes in attributesCache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
    override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        
        let attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
        attributes.frame = CGRect(x: 20, y: 20, width: 320, height: 50)
        
        return attributes
    }
    
    func columnsBasedOnScreen() -> Int {
        let orientation = UIApplication.shared.statusBarOrientation
        if orientation == UIInterfaceOrientation.portrait || orientation == UIInterfaceOrientation.portraitUpsideDown {
            // portrait
            return 1
            
        } else {
            // landscape
            let horizontalSizeClass = self.collectionView?.traitCollection.horizontalSizeClass
            let verticalSizeClass = self.collectionView?.traitCollection.verticalSizeClass
            
            if horizontalSizeClass == UIUserInterfaceSizeClass.regular && verticalSizeClass == UIUserInterfaceSizeClass.regular {
                let applicationDelegate = UIApplication.shared.delegate
                
                guard let delegate = applicationDelegate else {
                    return 1
                }
                
                guard let window = delegate.window else {
                    return 1
                }
                
                let isFullscreen = window!.frame.equalTo(window!.screen.bounds)
                
                if isFullscreen {
                    return 2
                } else {
                    return 1
                }
            } else {
                return 1
            }
            
        }
    }
}
