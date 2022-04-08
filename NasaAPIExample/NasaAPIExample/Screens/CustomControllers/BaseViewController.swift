//
//  BaseViewController.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin, Vodafone on 4/8/22.
//

import UIKit

class BaseViewController: UIViewController, UIGestureRecognizerDelegate {
    
    fileprivate var activityView: UIView?
    var vSpinner : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // for swipe back
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    
    func showError() {
        let alertController = UIAlertController(title: MessageConstants.ApiResponseTitle.Warning, message: MessageConstants.ApiErrorMessages.NoElements, preferredStyle:UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "TAMAM", style: .default, handler: { (_) in
            alertController.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .large)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            self.vSpinner?.removeFromSuperview()
            self.vSpinner = nil
        }
    }
}
