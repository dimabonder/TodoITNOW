//
//  MainViewController.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 29/06/2022.
//

import UIKit
import Combine

class MainViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var viewTopBar: CustomTopBar!
    
    //MARK: - Properties
    private let viewModel: MainViewModel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupUI()
    }
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    private func setDelegates() {
        viewTopBar.delegate = self
    }

    private func gotoCreateProfileVC() {
        let createProfileVC = ProfilePopupViewController()
        createProfileVC.delegate = self
        createProfileVC.modalPresentationStyle = .popover
        createProfileVC.modalTransitionStyle = .coverVertical
        present(createProfileVC, animated: true)
    }
    
    private func setupUI() {
        viewTopBar.configureUI(profileImage: viewModel.getUserImage(), profileName: viewModel.profileName)
    }
    
    //MARK: - Actions
    
}

//MARK: - CustomTopBar , UIImagePicker
extension MainViewController: CustomTopBarDelegate {
    func didTapProfileImageViewBtn() {
        gotoCreateProfileVC()
    }
    
    func didTapAddActionBtn() {
    }
}

extension MainViewController: ProfilePopupViewControllerDelegate {
    func handleUIForSelected(image: UIImage, profileName: String) {
        viewTopBar.configureUI(profileImage: image, profileName: profileName)
    }
}
