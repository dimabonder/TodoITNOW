//
//  ProfilePopupViewController.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 29/06/2022.
//

import UIKit
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
        
        guard let imageData = UserDefaults.standard.data(forKey: "ProfileImage") else { return }
        guard let text = textField.text else { return }
        
        do {
            let imageDecoded = try PropertyListDecoder().decode(Data.self, from: imageData)
            
            if let profileImage = UIImage(data: imageDecoded) {
                delegate?.handleUIForSelected(image: profileImage, profileName: text)
            }
        }
        catch {
            print("Couldn't decode data and convert it to UIImage")
        }
        dismiss(animated: true)
    }
}

extension ProfilePopupViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        viewSucces.isHidden = false
        
        self.dismiss(animated: true)
        //convert image selected to data and store it in userDefualts.
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        do {
            let imageEncoded = try PropertyListEncoder().encode(imageData)
            UserDefaults.standard.set(imageEncoded, forKey: "ProfileImage")
        }
        catch {
            print("Couldn't encode image ")
        }
    }
}

extension ProfilePopupViewController: UITextFieldDelegate {}
