//
//  UIViewController.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin, Vodafone on 4/7/22.
//

import UIKit

fileprivate var activityView: UIView?

extension UIViewController {
    func showError() {
        let alertController = UIAlertController(title: MessageConstants.ApiResponseTitle.Warning, message: MessageConstants.ApiErrorMessages.NoElements, preferredStyle:UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "TAMAM", style: .default, handler: { (_) in
            alertController.dismiss(animated: true, completion: nil)
            self.navigationController?.popViewController(animated: true)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
}

