//
//  CustomXib.swift
//  ToDoRightNow
//
//  Created by Dima Bonder on 20/06/2022.
//

import UIKit

class CustomXibView: UIView {

    private(set) var container: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        if let customView = Bundle.main.loadNibNamed(xibName(), owner: self, options: nil)?.first as? UIView {
            backgroundColor = UIColor.clear
            customView.frame = self.bounds
            customView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
            customView.tag = 99
            container = customView
            addSubview(customView)
        }
    }
    
    func xibName() -> String {
        return self.className
    }
}
