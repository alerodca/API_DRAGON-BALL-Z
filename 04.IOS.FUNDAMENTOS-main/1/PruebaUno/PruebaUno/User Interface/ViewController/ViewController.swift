//
//  ViewController.swift
//  PruebaUno
//
//  Created by Oscar Rodriguez Garrucho on 12/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var showDetailsButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeLabel.text = "Soy una label"
        title = "HomeView"
        
    }

    @IBAction func showDetailsButtonTapped(_ sender: UIButton) {
        let details = FourViewController()
        navigationController?.pushViewController(details, animated: true)
    }
    
    
}

