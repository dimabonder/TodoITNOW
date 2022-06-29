//
//  ProfilePopupViewController.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 29/06/2022.
//

import UIKit

protocol ProfilePopupViewControllerDelegate: AnyObject {
    func handleImageSelected(image: UIImage)
    func didTapContinueButton()
    func didTapAnonymousButton()
}

class ProfilePopupViewController: UIViewController {

    @IBOutlet weak var viewSucces: UIView!
    @IBOutlet weak var textField: UITextField!
    private let imagePicker = UIImagePickerController()
    
    weak var delegate: ProfilePopupViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        setupDelegates()
    }

    private func setupDelegates() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        textField.delegate = self
    }
    
    @IBAction func btnAddImagePressed(_ sender: UIButton) {
        present(imagePicker, animated: true)
    }
    
    @IBAction func btnContinuePressed(_ sender: UIButton) {
        
    }
    
    @IBAction func btnAnonymousPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
}

extension ProfilePopupViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        self.dismiss(animated: true)
        delegate?.handleImageSelected(image: image)
    }
}

extension ProfilePopupViewController: UITextFieldDelegate {
    
}
