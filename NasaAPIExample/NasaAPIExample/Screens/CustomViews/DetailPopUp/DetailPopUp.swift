//
//  DetailPopUp.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin on 4/11/22.
//

import UIKit

class DetailPopUp: UIView {
    
    static let instance = DetailPopUp()
    
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var holderView: UIView!
    @IBOutlet weak var earthDate: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cameraValue: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var launchDate: UILabel!
    @IBOutlet weak var landingDate: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed(String(describing: DetailPopUp.self), owner: self, options: nil)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        holderView.layer.cornerRadius = 8
        holderView.addShadow()
        imageView.layer.cornerRadius = 8
        imageView.addShadow()
        parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    func showAlert(earthDateText: String, cameraText: String, nameText: String, statusText: String, launchDateText: String, landingDateText: String, image: String){
        earthDate.text = earthDateText
        cameraValue.text = cameraText
        name.text = nameText
        status.text = statusText
        launchDate.text = launchDateText
        landingDate.text = landingDateText
        imageView.kf.setImage(with: URL(string: image))
        if let keyWindow = UIWindow.key {
            keyWindow.addSubview(parentView)
        }
    }
    
    func hideAlert() {
        configureClear()
        parentView.removeFromSuperview()
    }
    
    @IBAction func close(_ sender: Any) {
        hideAlert()
    }
    
    private func configureClear() {
        earthDate.text = ""
        cameraValue.text = ""
        name.text = ""
        status.text = ""
        launchDate.text = ""
        landingDate.text = ""
    }
    
}
