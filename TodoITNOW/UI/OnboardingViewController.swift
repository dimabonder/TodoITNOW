//
//  OnboardingViewController.swift
//  TodoITNOW
//
//  Created by Dima Bonder on 27/06/2022.
//

import UIKit
import Combine

class OnboardingViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var btnAction: UIButton!
    @IBOutlet weak var pageCntrl: UIPageControl!
    
    private let viewModel: OnboardingViewModel!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    //MARK: - Methods
    
    init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "OnboardingCell", bundle: .main), forCellWithReuseIdentifier: "OnboardingCell")
        collectionView.setCollectionViewLayout(createLayout(), animated: true)
        collectionView.alwaysBounceVertical = false
        collectionView.reloadData()
        
    }
    
    //MARK: - Action
    @IBAction func btnActionPressed(_ sender: UIButton) {
    }
    
}

//MARK: - UICollectionViewDelegate , UICollectionViewDataSource
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.onBoardingDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as? OnboardingCell else { return UICollectionViewCell()}
        let image = viewModel.onBoardingDataSource[indexPath.row].image
        let titleForImage = viewModel.onBoardingDataSource[indexPath.row].title
        cell.configureUI(imageName: image, title: titleForImage)
        return cell
    }
}

//MARK: - CompositionalAutoLayout
extension OnboardingViewController {
    func createLayout() -> UICollectionViewLayout {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        
        return UICollectionViewCompositionalLayout(section: section)
    }
}
