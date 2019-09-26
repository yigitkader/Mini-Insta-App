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
    @IBOutlet weak var selecetImageLabel: UILabel!
    
    
    var timerImage = Timer()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Call Time Func
        timerImageFunc()

        
    }
    
    
    
    
    
    
    /* STORAGE AND DATABASE OPR. FIREBASE */
    @IBAction func postButton(_ sender: Any) {
        
        buttonPost.isEnabled = false
        
        /*  Storage*/
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        let mediaFolder = storageRef.child("Media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            
            let imageRef = mediaFolder.child("\(uuid).jpg")
            
            imageRef.putData(data, metadata: nil) { (metaData, error) in
                
                if error != nil {
                    //error
                    
                    self.makeAlertFunc(alertTitle: "Error", alertMessage: error?.localizedDescription ?? "error")
                }else{
                    
                    //no error
                    
                    imageRef.downloadURL { (url, error) in
                        
                        if error != nil {
                            
                            self.makeAlertFunc(alertTitle: "Error", alertMessage: error?.localizedDescription ?? "error")
                            
                        }else{
                            
                            let imageUrl = url?.absoluteString
                            
//                            print(imageUrl)
                            
                            
                            /* -- DATABASE --- */
                            
                            
                            let firestoreDatabase = Firestore.firestore()
                            
                            var firestoreRef : DocumentReference? = nil
                            
                            
                            let firestorePost = ["imageUrl" : imageUrl!, "postedBy" : Auth.auth().currentUser!.email! , "postComment" : self.commentText.text! , "date" : FieldValue.serverTimestamp() , "likes" : 0 ] as [String : Any]
                            
                            
                            
                            firestoreRef = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { (error) in
                                if error != nil {
                                    
                                    self.makeAlertFunc(alertTitle: "Error", alertMessage: error?.localizedDescription ?? "Error")
                                }else{
                                    self.buttonPost.isEnabled = true
                                    self.imageView.image = UIImage(named: "")
                                    self.commentText.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                          
                                          
                                }
                            })
                            
                        }
                        
                        
                    }
                    
                }
            }
            
            
        }
        
        
      
        
        
           
           
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
            selecetImageLabel.isHidden = false
            
               
       }else{
            commentText.isHidden = false
            buttonPost.isHidden = false
            showImageView.isHidden = true
            selecetImageLabel.isHidden = true
            view.backgroundColor = UIColor.white
       
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
