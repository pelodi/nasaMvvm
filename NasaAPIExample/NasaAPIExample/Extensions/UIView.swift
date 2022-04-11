//
//  UIView.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin on 4/8/22.
//

import UIKit

extension UIView {
    
    //MARK: Add Shadow
    func addShadow(color: UIColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.15), opacity: Float = 1.0, radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        self.layer.shadowRadius = radius
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
}
