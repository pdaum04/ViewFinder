//
//  NewPhotoViewController.swift
//  KlossAGram
//
//  Created by Apple on 7/29/19.
//  Copyright © 2019 KWK. All rights reserved.
//

import UIKit

class NewPhotoViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController ()
    
    
@IBOutlet weak var TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
//@IBAction func camera (_ sender: Any) {
//        imagePicker.sourceType = .camera
//        present(imagePicker, animated: true, completion: nil)
    @IBAction func camera (_ sender: Any){
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func photoLibrary (_ sender:Any){
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
  @IBOutlet weak var ImageDisplay: UIImageView!
 
    internal func imagePickerControllerDidCancel(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        }
    imagePicker.dismiss(animated: true, completion: nil)
}
    @IBAction func savePhotoTapped(_ sender: UIButton){
        
if let context =
(UIApplication.shared.delegate as?
AppDelegate)?.persistentContainer.viewContext {
            let photoToSave = Photos(entity: Photos.entity(), insertInto: context)
            photoToSave.caption = TextField.text
    if let userImage = ImageDisplay.image{
        if let userImageData = userImage.pngData(){
        photoToSave.imageData = userImageData
        }
    }
    (UIApplication.shared.delegate as?
    AppDelegate)?.saveContext()
    
    navigationController?.popViewController(animated: true)
        }
    }

    // Halfway through code
//    }

//private func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


