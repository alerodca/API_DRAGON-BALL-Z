//
//  HomeTabBarController.swift
//  Proyecto
//
//  Created by Alejandro Rodríguez Cañete on 7/6/23.
//

import UIKit

class HomeTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setupTabs()
}

    private func setupTabs() {
        let navigationController = UINavigationController(rootViewController: TableViewController())
        let tabImage = UIImage(systemName: "text.justify")!
        navigationController.tabBarItem = UITabBarItem(title: "TableView", image: tabImage, tag: 0)
        
        let collectionViewController = CollectionViewController()
        let tabImage2 = UIImage(systemName: "square.grid.3x3.topleft.filled")!
        collectionViewController.tabBarItem = UITabBarItem(title: "CollectionView", image: tabImage2, tag: 1)
        
        viewControllers = [navigationController, collectionViewController]
    }

    private func setupLayout() {
        tabBar.backgroundColor = .systemBackground
    }

}
