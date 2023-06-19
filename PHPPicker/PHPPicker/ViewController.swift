//
//  ViewController.swift
//  PHPPicker
//
//  Created by Alejandro Rodríguez Cañete on 13/6/23.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func OpenGallery(_ sender: UIButton) {
        var configuration = PHPickerConfiguration(photoLibrary: .shared())
        configuration.selectionLimit = 1
        configuration.filter = .images
        
        let pickerView = PHPickerViewController(configuration: configuration)
        pickerView.delegate = self
        
        present(pickerView, animated: true)
    }
}

extension ViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        guard let firstItemProvider = results.first?.itemProvider else { return }
        
        if firstItemProvider.canLoadObject(ofClass: UIImage.self) {
            firstItemProvider.loadObject(ofClass: UIImage.self) { image, error in
                if let image = image as? UIImage {
                    DispatchQueue.main.async {
                        UIView.transition(with: self.imageView, duration: 0.5, options: .transitionFlipFromRight) {
                            self.imageView.image = image
                        }
                    }
                }
                else if let error = error {
                    print(error.localizedDescription)
                }
            }
        }
    }
}
