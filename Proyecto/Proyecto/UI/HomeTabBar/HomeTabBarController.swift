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
        
        NotificationCenter.default.addObserver(self, selector: #selector(fetchHeroes), name: Notification.Name("FetchHeroes"), object: nil)
}

    @objc func fetchHeroes() {
        print("Looking for new heroes from HomeTabBarController")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    private func setupTabs() {
        let navigationController1 = UINavigationController(rootViewController: TableViewController())
        let tabImage = UIImage(systemName: "text.justify")!
        navigationController1.tabBarItem = UITabBarItem(title: "TableView", image: tabImage, tag: 0)
        
        let navigationController2 = UINavigationController(rootViewController: CollectionViewController())
        let tabImage2 = UIImage(systemName: "square.grid.3x3.topleft.filled")!
        navigationController2.tabBarItem = UITabBarItem(title: "CollectionView", image: tabImage2, tag: 1)
        
        viewControllers = [navigationController1, navigationController2]
    }

    private func setupLayout() {
        tabBar.backgroundColor = .systemBackground
    }

}
