//
//  ProfilePopupView.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 29/06/2022.
//

import UIKit

protocol ProfilePopupViewDelegate: AnyObject {
    func didTapContinueBtn()
    func didTapAnonymousBtn()
    func handleProfileNameWith(name:String)
    func handleProfileImageWith(image: UIImage)
}

class ProfilePopupView: CustomXibView {
   
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var viewSuccessImageUplaoded: UIView!
    
    private let imagePicker = UIImagePickerController()
    
    weak var delegate: ProfilePopupViewDelegate?
    
    @IBAction func btnAddImagePressed(_ sender: UIButton) {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
    }
    
    @IBAction func btnContinuePressed(_ sender: UIButton) {
        
    }
    
    @IBAction func btnStayAnonymousPressed(_ sender: UIButton) {
        
    }
}

extension ProfilePopupView: UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    }
}
