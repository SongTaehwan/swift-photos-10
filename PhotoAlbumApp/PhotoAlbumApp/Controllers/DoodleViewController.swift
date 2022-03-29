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
    }
    
    private func loadJSON() {
        guard let url = Bundle.main.url(forResource: "doodle", withExtension: "json") else { return }
        guard let data = try? Data.init(contentsOf: url) else { return }
        
        let decoder = JSONDecoder()
        
        self.assets = try? decoder.decode(Assets.self, from: data)
    }
    
    private func configureBarButton() {
        let button = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(self.closeModal))
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc private func closeModal() {
        self.dismiss(animated: true)
    }
}
