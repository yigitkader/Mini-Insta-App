//
//  FeedCellTableViewCell.swift
//  MiniInsta
//
//  Created by calzom on 25.09.2019.
//  Copyright © 2019 YigitKader. All rights reserved.
//

import UIKit
import Firebase


class FeedCell: UITableViewCell {

    
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userComment: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userLikeLabel: UILabel!
    @IBOutlet weak var documentIdLabel: UILabel!
    
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func likeButton(_ sender: Any) {
        
            
            updateLikesFunc()
        
    }
    
    
    func updateLikesFunc(){
        
        

       let firestoreDatabase = Firestore.firestore()
        
       if let likeCounter = Int(userLikeLabel.text!) {
                    
                  
                          
         let likePostStore = ["likes" : likeCounter + 1] as [String : Any]
                      
         //update opr.  and merge is for just like
         firestoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(likePostStore, merge: true)
         
                
                    
    }
        
        
        
    }
    

}
