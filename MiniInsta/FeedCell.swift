//
//  FeedCellTableViewCell.swift
//  MiniInsta
//
//  Created by calzom on 25.09.2019.
//  Copyright © 2019 YigitKader. All rights reserved.
//

import UIKit


class FeedCell: UITableViewCell {

    
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userComment: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userLikeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    @IBAction func likeButton(_ sender: Any) {
    }
    
    

}
