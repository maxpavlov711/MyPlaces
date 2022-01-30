//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Max Pavlov on 30.01.22.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    @IBOutlet weak var imageOfPlace: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
    }

//    MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(sourse: .camera)
            }
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(sourse: .photoLibrary)
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
        } else {
            view.endEditing(true)
        }
    }

}

// MARK: - Text field delegate
extension NewPlaceViewController: UITextFieldDelegate {

    //    Скрытие клавиатуры по нажатию на done
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: - Work is Image
extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(sourse: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(sourse) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = sourse
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageOfPlace.image = info[.editedImage] as? UIImage
        imageOfPlace.contentMode = .scaleAspectFill
        imageOfPlace.clipsToBounds = true
        dismiss(animated: true)
    }
}
