//
//  ViewController.swift
//  CameraApp
//
//  Created by Alejandro Rodríguez Cañete on 17/6/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cameraImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
    }

    @IBAction func takeAPhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            
            present(imagePicker, animated: true)
        }
    }
    
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            cameraImageView.image = image
        
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveImage), nil)
        }
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    @objc func saveImage(_ image: UIImage, error: Error?, context: UnsafeMutableRawPointer?){
        if let error = error {
            print(error.localizedDescription)
        } else {
            print("Yu-huu!")
        }
    }
}
