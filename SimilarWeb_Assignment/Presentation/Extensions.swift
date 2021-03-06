//
//  Extensions.swift
//  SimilarWeb_Assignment
//
//  Created by Admin on 05/04/2021.
//  Copyright © 2021 fuxlud. All rights reserved.
//

import UIKit

extension UIView {
    public class var className: String {
        let className: String = NSStringFromClass(self).components(separatedBy: ".").last!
        return className
    }
}

extension UIViewController {
    public class var className: String {
        let className = String(describing: self).components(separatedBy: ".").first!
        return className
    }
    
    public func showError(error: Error){
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIView {
    var borderColor: UIColor {
        set {
            self.layer.borderColor = newValue.cgColor
        }

        get {
            return UIColor(cgColor: self.layer.borderColor ?? UIColor(cgColor: UIColor.clear.cgColor) as! CGColor)
        }
    }
}
