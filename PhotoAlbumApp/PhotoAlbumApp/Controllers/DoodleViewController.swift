//
//  DoodleViewController.swift
//  PhotoAlbumApp
//
//  Created by 송태환 on 2022/03/29.
//

import UIKit

class DoodleViewController: UICollectionViewController {
    private var assets: Assets?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadJSON()
        self.configureNavigationController()
//        self.collectionView.backgroundColor = .darkGray
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let width = view.bounds.inset(by: view.safeAreaInsets).width
        let columnCount = (width / 100).rounded(.towardZero)
        let spacing: CGFloat = 1.2
        
        guard let layout = self.collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }
        let cellWidth = (width / columnCount) - spacing
        
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        layout.minimumInteritemSpacing = spacing
        layout.minimumLineSpacing = spacing
    }
    
    private func loadJSON() {
        guard let url = Bundle.main.url(forResource: "doodle", withExtension: "json") else { return }
        guard let data = try? Data.init(contentsOf: url) else { return }
        
        let decoder = JSONDecoder()
        
        self.assets = try? decoder.decode(Assets.self, from: data)
    }
    
    private func configureNavigationController() {
        let button = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(self.closeModal))
//        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationItem.rightBarButtonItem = button
        self.navigationItem.title = "Doodles"
    }
    
    @objc private func closeModal() {
        self.dismiss(animated: true)
    }
}
