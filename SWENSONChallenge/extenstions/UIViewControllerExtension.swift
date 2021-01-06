//
//  UIViewControllerExtension.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
