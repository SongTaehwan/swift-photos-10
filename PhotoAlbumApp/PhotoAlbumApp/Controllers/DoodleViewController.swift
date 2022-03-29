//
//  DoodleViewController.swift
//  PhotoAlbumApp
//
//  Created by 송태환 on 2022/03/29.
//

import UIKit

class DoodleViewController: UICollectionViewController {
    // MARK: - Properties
    private let spacing: CGFloat = 1.2
    private var assets: Assets?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadJSON()
        self.configureCollectionView()
        self.configureNavigationController()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let width = view.bounds.inset(by: view.safeAreaInsets).width
        let columnCount = (width / 100).rounded(.towardZero)
        let cellWidth = (width / columnCount) - self.spacing
        
        guard let layout = self.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
    }
    
    // MARK: - Configuration
    private func configureNavigationController() {
        let button = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(self.closeModal))
        self.navigationItem.rightBarButtonItem = button
        self.navigationItem.title = "Doodles"
    }
    
    private func configureCollectionView() {
        guard let layout = self.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        
        layout.minimumInteritemSpacing = self.spacing
        layout.minimumLineSpacing = self.spacing
        layout.scrollDirection = .vertical
    }
    
    private func loadJSON() {
        guard let url = Bundle.main.url(forResource: "doodle", withExtension: "json") else { return }
        guard let data = try? Data.init(contentsOf: url) else { return }
        
        let decoder = JSONDecoder()
        
        self.assets = try? decoder.decode(Assets.self, from: data)
    }
    
    // MARK: - Handlers
    @objc private func closeModal() {
        self.dismiss(animated: true)
    }
}
