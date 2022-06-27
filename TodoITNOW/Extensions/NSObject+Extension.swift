//
//  NSObject+Extension.swift
//  ToDoRightNow
//
//  Created by Dima Bonder on 20/06/2022.
//

import Foundation

extension NSObject {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
