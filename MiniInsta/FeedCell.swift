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
    
    
    var counter1 = 0
    var counter2 = 0
    
    var userArray = [String]()
    
    
    
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
        
        if let likeCounter = Int(self.userLikeLabel.text!) {
                    
                  
                          
         let likePostStore = ["likes" : likeCounter + 1] as [String : Any]
                      
         //update opr.  and merge is for just like
         firestoreDatabase.collection("Posts").document(self.documentIdLabel.text!).setData(likePostStore, merge: true)
         
                
                    
        }
        
        
        
    }
    
    
    

}
