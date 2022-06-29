//
//  MainViewController.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 29/06/2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var viewTopBar: CustomTopBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
    }
    
    private func setDelegates() {
        viewTopBar.delegate = self
    }
    
    private func presentProfilePopup() {
        let profilePopupVC = ProfilePopupViewController()
        profilePopupVC.modalPresentationStyle = .overCurrentContext
        profilePopupVC.modalTransitionStyle = .crossDissolve
        present(profilePopupVC, animated: true)
    }
}

//MARK: - CustomTopBar , UIImagePicker
extension MainViewController: CustomTopBarDelegate {
    func didTapProfileImageViewBtn() {
        presentProfilePopup()
    }
    
    func didTapAddActionBtn() {
    }
}
