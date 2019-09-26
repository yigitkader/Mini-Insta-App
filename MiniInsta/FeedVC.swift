//
//  FeedVC.swift
//  MiniInsta
//
//  Created by calzom on 25.09.2019.
//  Copyright © 2019 YigitKader. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    var documentIdArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        getDatasFromFirestore()
        
    }
    
    
    
    
    
    
    
    
    
    
    
    func getDatasFromFirestore(){
        
       
        let firestoreDatabase = Firestore.firestore()
        
        /* settings for date!! - if it is strikethrough , dont use it*/
        /*
         let settings = firestoreDatabase.settings
         settings.areTimestampsInSnapshotsEnabled
         */
        
        /*  Filter with Order*/
        
        firestoreDatabase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { (snapshot, error) in
            
            if error != nil {
                //error
                
                self.makeAlertFunc(alertTitle: "Error", alertMessage: error?.localizedDescription ?? "error")
            }else{
                
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userCommentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.documentIdArray.removeAll(keepingCapacity: false)
                           
                    
                    for document in snapshot!.documents {
                        
                        
                        let documentId = document.documentID
                        self.documentIdArray.append(documentId)
                        
                        if let postedBy = document.get("postedBy") as? String {
                            
                            self.userEmailArray.append(postedBy)
                            
                        }
                        
                        if let postComment = document.get("postComment") as? String {
                            
                            self.userCommentArray.append(postComment)
                        }
                        if let likes = document.get("likes") as? Int {
                            
                            self.likeArray.append(likes)
                        }
                        
                        if let imageUrl = document.get("imageUrl") as? String {
                            
                            self.userImageArray.append(imageUrl)
                        }
                        
                        
                    }
                    
                    self.tableView.reloadData()
                }
               
                
            }
             
        }
        
        
        
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return userImageArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        
        cell.userEmail.text = userEmailArray[indexPath.row]
        cell.userComment.text = userCommentArray[indexPath.row]
        cell.userLikeLabel.text = String(likeArray[indexPath.row])
        cell.documentIdLabel.text = documentIdArray[indexPath.row]
        cell.userImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row]))
        
        
        
        
        return cell
    }
    
    
    /*  -- ALERT FUNC --- */
      func makeAlertFunc(alertTitle:String , alertMessage:String){
            
            let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
            
            let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
            
        }
      
    

}
