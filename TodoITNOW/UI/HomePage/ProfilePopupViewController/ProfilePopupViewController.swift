//
//  ProfilePopupViewController.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 29/06/2022.
//

import UIKit
import Combine
import IQKeyboardManagerSwift

protocol ProfilePopupViewControllerDelegate: AnyObject {
    func handleUIForSelected(image: UIImage, profileName: String)
}

class ProfilePopupViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var viewEditImage: UIImageView!
    @IBOutlet weak var viewSucces: UIView!
    @IBOutlet weak var textField: UITextField!
    
    //MARK: - Properties
    private let imagePicker = UIImagePickerController()
    
    weak var delegate: ProfilePopupViewControllerDelegate?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        setupDelegates()
    }
    
    //MARK: - Methods
    private func setupDelegates() {
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        textField.delegate = self
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    
    //MARK: - Actions
    @IBAction func btnAddImagePressed(_ sender: UIButton) {
        present(imagePicker, animated: true)
    }

    @IBAction func btnSavePressed(_ sender: UIButton) {
        //get the imageData and transform it to uiimage.
        guard let imageData = UserDefaults.standard.object(forKey: "ProfileImage") as? Data else { return }
        guard let image = UIImage(data: imageData) else { return }
        guard let text = textField.text else { return }
        delegate?.handleUIForSelected(image: image, profileName: text )
        dismiss(animated: true)
    }
}

extension ProfilePopupViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        viewSucces.isHidden = false
        self.dismiss(animated: true)
        //convert image selected to data and store it in userDefualts.
        let imageData = image.pngData()
        UserDefaults.standard.set(imageData, forKey: "ProfileImage")
    }
}

extension ProfilePopupViewController: UITextFieldDelegate {}
