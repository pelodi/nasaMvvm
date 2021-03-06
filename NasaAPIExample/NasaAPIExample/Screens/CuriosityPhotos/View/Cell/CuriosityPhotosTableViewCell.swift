//
//  CuriosityPhotosTableViewCell.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin on 4/8/22.
//

import UIKit
import Kingfisher

class CuriosityPhotosTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: CuriosityPhotosTableViewCell.self)
    static let nibName: String = identifier
    
    @IBOutlet weak var curiosityImage: UIImageView!
    @IBOutlet weak var holderView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.holderView.addShadow()
        self.imageView?.addShadow()
        self.holderView.layer.cornerRadius = 10
        self.imageView?.layer.cornerRadius = 8
    }
    
    public func configure(with model: Photos) {
        curiosityImage.kf.setImage(with: URL(string: model.img_src ?? ""))
    }
}
