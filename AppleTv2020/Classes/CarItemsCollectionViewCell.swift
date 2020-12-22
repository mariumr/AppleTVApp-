//
//  CarItemsCollectionViewCell.swift
//  Marium_FinalExam2020
//
//  Created by Xcode User on 2020-12-12.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class CarItemsCollectionViewCell: UICollectionViewCell {
    
    let getData = CarDetails()
    
    @IBOutlet var featuredImage : UIImageView!
    @IBOutlet var lblCar : UILabel!
    
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        
        if(self.isFocused){
            self.featuredImage.adjustsImageWhenAncestorFocused = true
        }
        
        else {
            self.featuredImage.adjustsImageWhenAncestorFocused = false
        }
    }
    
    
}
