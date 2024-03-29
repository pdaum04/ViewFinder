//
//  PostTableViewController.swift
//  KlossAGram
//
//  Created by Apple on 7/30/19.
//  Copyright © 2019 KWK. All rights reserved.
//

import UIKit

class PostTableViewController: UITableViewController {

    var photos : [Photos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func getPhotos (){
        if let contex =
    (UIApplication.shared.delegate as? AppDelegate)? .persistentContainer.viewContext
        {
            if let coreDataPhotos = try?
                contex.fetch(Photos.fetchRequest())as? [Photos] {
                    photos = coreDataPhotos
                    tableView.reloadData()
                }
            }
        }
    
    override func viewWillAppear(_ animated: Bool) {
        getPhotos()
    }

    // MARK: - Table view data source

        // #warning Incomplete implementation, return the number of sections


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        let cellPhoto = photos[indexPath.row]
        
        cell.textLabel?.text = cellPhoto.caption
        cell.imageView?.image = UIImage(named:"Karlie")
        
        if let cellPhotoImageData = cellPhoto.imageData {
            if let cellPhotoImage = UIImage(data: cellPhotoImageData){
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailSegue", sender: photos[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue"{
            if let photoDetailView = segue.destination as?
                PhotoDetailViewController{
                
                if let photoToSend = sender as? Photos {
                    photoDetailView.photo = photoToSend
                }
                
            }
            
        }
    }

 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {if let context = (UIApplication.shared.delegate as?
            AppDelegate)?.persistentContainer.viewContext
        {
            let photoToDelete = photos[indexPath.row]
            context.delete(photoToDelete)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            getPhotos()
            }
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
