//
//  MainViewController.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 29/06/2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var viewTopBar: CustomTopBar!
    private let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    
    private func setDelegates() {
        viewTopBar.delegate = self
        imagePicker.delegate = self
    }
}

//MARK: - CustomTopBar , UIImagePicker
extension MainViewController: CustomTopBarDelegate, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func didTapProfileImageViewBtn() {
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    func didTapAddActionBtn() {
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        self.dismiss(animated: true)
        viewTopBar.configureUI(profileImage: image, profileName: "Your Name Here")
    }
}
