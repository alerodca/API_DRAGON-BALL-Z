//
//  FourViewController.swift
//  PruebaUno
//
//  Created by Oscar Rodriguez Garrucho on 12/12/22.
//

import UIKit

class FourViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var showButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func showButtonTapped(_ sender: Any) {
        let details = ThirdViewController()
        navigationController?.pushViewController(details, animated: true)
        
    }
    
}
