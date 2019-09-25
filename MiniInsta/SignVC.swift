//
//  SignVC.swift
//  MiniInsta
//
//  Created by calzom on 25.09.2019.
//  Copyright © 2019 YigitKader. All rights reserved.
//

import UIKit
import Firebase


class SignVC: UIViewController {

    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInButton(_ sender: Any) {
        
        
               
        if emailText.text != "" && passwordText.text != "" {


            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (data, error) in

                if error != nil { //error

                    self.makeAlertFunc(alertTitle: "Error", alertMessage: error?.localizedDescription ?? "error")


                }else{

                    self.performSegue(withIdentifier: "segueToFeedVC", sender: nil)

                }

            }


        }else{

            self.makeAlertFunc(alertTitle: "Error", alertMessage: "Email/Password Required")
        }


        
        
        
    }
    
    
    
    
    
    @IBAction func signUpButton(_ sender: Any) {
        
        
         if emailText.text != "" && passwordText.text != "" {
        
                    Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (data, error) in
        
        
        
                        if error != nil {
        
                            self.makeAlertFunc(alertTitle: "Error", alertMessage: error?.localizedDescription ?? "error")
        
                        }
                        else{ // no error
        
        
                            self.performSegue(withIdentifier: "segueToFeedVC", sender: nil)
        
                        }
                    }
        
        
        
        
        
                }else{
        
        
                    self.makeAlertFunc(alertTitle: "Error", alertMessage: "Email/Password Required")
        
                }
        
        
    }
    
    
    
    
    func makeAlertFunc(alertTitle:String , alertMessage:String){
        
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}
