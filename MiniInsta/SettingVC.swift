//
//  SettingVC.swift
//  MiniInsta
//
//  Created by calzom on 25.09.2019.
//  Copyright © 2019 YigitKader. All rights reserved.
//

import UIKit
import Firebase


class SettingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        
        
        
            do {

                try  Auth.auth().signOut()

                self.performSegue(withIdentifier: "segueToSignVC", sender: nil)

            }catch{

                print("error")
            }


        
        
    }
    

}
