//
//  OnboardingCell.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 27/06/2022.
//

import UIKit

class OnboardingCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureUI(imageName: String, title: String) {
        //converteString to actual UIImage
        let image = UIImage(named: imageName)
        imageView.image = image
        lblTitle.text = title
    }
}

