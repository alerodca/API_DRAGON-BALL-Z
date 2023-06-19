//
//  DetailsViewController.swift
//  PruebaUno
//
//  Created by Oscar Rodriguez Garrucho on 12/12/22.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var printButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func printButtonTapped(_ sender: UIButton) {
        print("print!")
    }
    
}
