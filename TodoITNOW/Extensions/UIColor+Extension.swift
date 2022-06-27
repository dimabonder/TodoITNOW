//
//  UIColor+Extension.swift
//  ToDoRightNow
//
//  Created by Dima Bonder on 20/06/2022.
//

import UIKit

enum AssetsColor {
    case blueNeon
    case offWhite
    case orangeJuice
    case pastelNeon
    case redLight
}

extension UIColor {
    static func appColor(_ name: AssetsColor) -> UIColor? {
        switch name {
        case .blueNeon:
            return UIColor(named: "blueNeon")
        case .offWhite:
            return UIColor(named: "offWhite")
        case .orangeJuice:
            return UIColor(named: "orangeJuice")
        case .pastelNeon:
            return UIColor(named: "pastelNeon")
        case .redLight:
            return UIColor(named: "redLight")
        }
    }
}
