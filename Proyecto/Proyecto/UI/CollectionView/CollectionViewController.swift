//
//  CollectionViewController.swift
//  Proyecto
//
//  Created by Alejandro Rodríguez Cañete on 7/6/23.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var heroes: [Heroe] = []
    
    let customRows = [
        CustomItem(image: UIImage(systemName: "pencil.circle")!, text: "Lunes"),
        CustomItem(image: UIImage(systemName: "trash.circle")!, text: "Martes"),
        CustomItem(image: UIImage(systemName: "folder.circle")!, text: "Miércoles"),
        CustomItem(image: UIImage(systemName: "paperplane.circle")!, text: "Jueves"),
        CustomItem(image: UIImage(systemName: "doc.circle")!, text: "Viernes"),
        CustomItem(image: UIImage(systemName: "terminal")!, text: "Sábado"),
        CustomItem(image: UIImage(systemName: "book.closed")!, text: "Domingo"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        navigationItem.title = "Heroes"
        heroes = LocalDataLayer.shared.getHeroes()
        
        let xib = UINib(nibName: "CollectionCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "customCollectionCell")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCollectionCell", for: indexPath) as! CollectionCell
        
        let heroes = heroes[indexPath.row]
        cell.iconImageView.setImage(url: heroes.photo)
        cell.titleLabel.text = heroes.name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsInRow: CGFloat = 2
        let spacing: CGFloat = 12
        let totalSpacing: CGFloat = (itemsInRow - 1) * spacing
        let finalWidth = (collectionView.frame.width - totalSpacing) / itemsInRow
        
        return CGSize(width: finalWidth, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let heroe = heroes[indexPath.row]
        let detailsView = DetailsViewController()
        detailsView.heroe = heroe
        navigationController?.pushViewController(detailsView, animated: true)
    }
}
