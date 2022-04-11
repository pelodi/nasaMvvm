//
//  UIWindow.swift
//  NasaAPIExample
//
//  Created by Tuncel, Pelin on 4/11/22.
//

import UIKit

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
