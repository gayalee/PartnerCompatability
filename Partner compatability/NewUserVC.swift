//
//  NewUserVC.swift
//  Partner compatability
//
//  Created by gaya lee melo on 05/12/14.
//  Copyright (c) 2014 gaya lee melo. All rights reserved.
//

import UIKit

class NewUserVC: UIViewController, UIAlertViewDelegate {


    @IBOutlet weak var txtUserName: UITextField!

    @IBOutlet weak var txtPassword: UITextField!

    @IBOutlet weak var txtEmail: UITextField!

    @IBOutlet weak var txtPhoneNumber: UITextField!
   
    
    
    @IBAction func actSignUp(sender: AnyObject) {
        signInToParse()
    }

    override func viewDidLoad() {
        
    }
    
    func signInToParse() {
        
        
        
        var user = PFUser()
        
        user.username = txtUserName.text
        user.password = txtPassword.text
        user.email = txtEmail.text
        // other fields can be set just like with PFObject
        user["phone"] = txtPhoneNumber.text
       
        
        
        // checking if the user exist in the data base, if not create a new one, if yes return error
        
        user.signUpInBackgroundWithBlock {
            (var succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                // Hooray! Let them use the app now.
            var alert = UIAlertView(title: "Mail Autenticat", message: "Please Approve you use in email", delegate: nil, cancelButtonTitle: "ok");
                alert.delegate=self
                alert.tag=1
               alert.show()
                      
             
            } else {
               // let errorString = error.userInfo["error"] as NSString
                // Show the errorString somewhere and let the user try again.
               var alert = UIAlertView(title: "User not available", message: "Please Change User", delegate: nil, cancelButtonTitle: "ok");
                alert.delegate=self
                alert.tag=2

             alert.show()
            }
        }
        
        
        
          }
    
    
    // uialertview delegate method - checking with button index pressed
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        
        if alertView.tag == 1 {
              self.dismissViewControllerAnimated(true, completion: nil)
        }
        
        
      
    }
    

}
