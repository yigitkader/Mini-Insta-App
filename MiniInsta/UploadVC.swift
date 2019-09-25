//
//  UploadVC.swift
//  MiniInsta
//
//  Created by calzom on 25.09.2019.
//  Copyright © 2019 YigitKader. All rights reserved.
//

import UIKit
import Firebase



class UploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var showImageView: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var buttonPost: UIButton!
    
    
    var timerImage = Timer()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //CALL TIMER FUNC
        timerImageFunc()

        
    }
    
    
    
    
    
    
    
    @IBAction func postButton(_ sender: Any) {
           
           
    }
       
       
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*  -- START OF CONTROL FUNC FOR PHOTO --- */
       func timerImageFunc(){
           
           timerImage = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.checkImage), userInfo: nil, repeats: true)
           
       }
       
     @objc func checkImage(){
          
       if imageView.image == nil {
               
           commentText.isHidden = true
           buttonPost.isHidden = true
           showImageView.isHidden = false
               
           }else{
           commentText.isHidden = false
           buttonPost.isHidden = false
           showImageView.isHidden = true
           
           }
          
       }
       /*  -- END OF CONTROL PHOTO --- */
    
    

        
   
    
    
    /* -- START CHOOSE IMAGE --- */
    @IBAction func choosePhotoFunc(_ sender: Any) {
        
        
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
        
    }
    
    /* -- END OF CHOOSE IMAGE --- */
  
    
    
    
    /*  -- ALERT FUNC --- */
    func makeAlertFunc(alertTitle:String , alertMessage:String){
          
          let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
          
          let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
          
          alert.addAction(okButton)
          self.present(alert, animated: true, completion: nil)
          
      }
    
    
    
    
    /* -- HIDE KEYBOARD AFTER TYPING --- */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
}
