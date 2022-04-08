//
//  CuriosityPhotosTableViewCell.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin, Vodafone on 4/8/22.
//

import UIKit
import Kingfisher

class CuriosityPhotosTableViewCell: UITableViewCell {
    
    @IBOutlet weak var curiosityImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with model: CollectionViewCellModel) {
        curiosityImage.kf.setImage(with: URL(string: model.image))
    }
}
