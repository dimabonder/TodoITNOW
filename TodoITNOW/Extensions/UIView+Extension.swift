//
//  UIView+Extension.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 29/06/2022.
//

import UIKit

extension UIView {
    func setShadows(color: CGColor) {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 1
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 0 , height: 2)
        self.layer.shadowPath = UIBezierPath(rect: CGRect(x: 0,
                                                          y: bounds.maxY - layer.shadowRadius,
                                                          width: bounds.width,
                                                          height: layer.shadowRadius)).cgPath
    }
}
