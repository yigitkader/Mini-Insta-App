//
//  FeedVC.swift
//  MiniInsta
//
//  Created by calzom on 25.09.2019.
//  Copyright © 2019 YigitKader. All rights reserved.
//

import UIKit
import Firebase


class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    
    
    
    
    
    
    
    
    
    func getDatasFromFirestore(){
        
        
        let firestoreDatabase = Firestore.firestore()
        
        /* settings for date!! - if it is strikethrough , dont use it*/
        /*
         let settings = firestoreDatabase.settings
         settings.areTimestampsInSnapshotsEnabled
         */
        
        
        
        
        
        
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        
        cell.userEmail.text = "test@email.com"
        cell.userComment.text = "test"
        cell.userLikeLabel.text = "10"
        cell.userImageView.image = UIImage(named: "instagram-logo.png")
        
        
        
        return cell
    }
    
    

}
