//
//  ViewController.swift
//  PHPicker
//
//  Created by Oscar Rodriguez Garrucho on 19/12/22.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    @IBOutlet weak var galleryImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func openGallery(_ sender: UIButton) {
        var configuracion = PHPickerConfiguration(photoLibrary: .shared())
        configuracion.selectionLimit = 1
        configuracion.filter = .images
        
        let pickerView = PHPickerViewController(configuration: configuracion)
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
                        UIView.transition(with: self.galleryImageView,
                                          duration: 0.5,
                                          options: .transitionFlipFromRight) {
                            self.galleryImageView.image = image
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
