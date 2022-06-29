//
//  CustomTopBar.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 29/06/2022.
//

import UIKit

protocol CustomTopBarDelegate: AnyObject {
    func didTapProfileImageViewBtn()
    func didTapAddActionBtn()
}

class CustomTopBar: CustomXibView {
    
    @IBInspectable var image: UIImage? {
        didSet {
            imgProfileView.image = image
        }
    }
    
    @IBInspectable var title: String? {
        didSet {
            lblProfileName.isHidden = title.nilOrEmpty()
            lblProfileName.text = title
        }
    }
    
    @IBOutlet weak var imgProfileView: UIImageView!
    @IBOutlet weak var lblProfileName: UILabel!
    @IBOutlet weak var btnAddAction: UIButton!
    
    // not in use - might use in the future for customs eprator.
    @IBOutlet weak var viewSeperator: UIView!
    
    weak var delegate: CustomTopBarDelegate?
    
    @IBAction func btnImgProfilePressed(_ sender: UIButton) {
        delegate?.didTapProfileImageViewBtn()
    }
    
    @IBAction func btnAddActionPressed(_ sender: UIButton) {
        delegate?.didTapAddActionBtn()
    }
    
    func configureUI(profileImage: UIImage, profileName: String) {
        imgProfileView.roundedImage()
        imgProfileView.image = profileImage
        lblProfileName.text = profileName
    }
}
