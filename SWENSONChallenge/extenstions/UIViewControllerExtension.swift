//
//  UIViewControllerExtension.swift
//  SWENSONChallenge
//
//  Created by Nariman Khaled on 1/6/21.
//

import UIKit

extension UIViewController {
    
    enum AlertOptionType: String {
        case ok = "OK"
        case cancel = "Cancel"
        case ignore = "Ignore"
        case gotIt = "GotIt"
    }
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
    
    
    func PresentErrorWithMessage(message : String) {
        presentAlertWithTitle(title: NSLocalizedString("Error", comment: ""), message: message  , options: .gotIt, completion: { (_) in})
    }
    
    func presentAlertWithTitle(title: String, message: String, options: AlertOptionType..., completion: @escaping (AlertOptionType) -> Void) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for option in options {
            var title = ""
            switch option {
            case .ok:
                title = NSLocalizedString("btn_OK", comment: "")
                break
            case .cancel:
                title = NSLocalizedString("btn_cancel", comment: "")
                break
            case .ignore:
                title = NSLocalizedString("btn_ignore", comment: "")
                break
            case .gotIt:
                title = NSLocalizedString("btn_Gotit", comment: "")
                break
            }
            alertController.addAction(UIAlertAction.init(title: title, style: .default, handler: { (action) in
                completion(option)
            }))
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    
}
