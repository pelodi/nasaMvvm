//
//  CuriosityPhotosTableViewCell.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin, Vodafone on 4/8/22.
//

import UIKit

class CuriosityPhotosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var curiosityImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with model: CollectionViewCellModel) {
        imageView.kf.setImage(with: URL(string: model.image))
    }
}
