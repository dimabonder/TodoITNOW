//
//  CustomTitleTextField.swift
//  TodoITNOW
//
//  Created by Dima Bonderzev on 10/07/2022.
//

import UIKit

class CustomTitleTextField: CustomXibView {

    //MARK: - Outlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    //MARK: - IBInspectable
    @IBInspectable var title: String? {
        didSet {
            lblTitle.text = title
        }
    }
    
    @IBInspectable var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
        }
    }
}
