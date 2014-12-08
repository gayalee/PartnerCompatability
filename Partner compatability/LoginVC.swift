//
//  LoginVC.swift
//  Partner compatability
//
//  Created by gaya lee melo on 05/12/14.
//  Copyright (c) 2014 gaya lee melo. All rights reserved.
//

import UIKit
protocol LoginVC_DELEGATE{
    func LoginVC_DidLodedIn()
}

class LoginVC: UIViewController {
    
    var delegate : LoginVC_DELEGATE?
    
   required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder);
    }
    

    
    @IBOutlet weak var txtUserName: UITextField!
    
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
    
    @IBAction func actLogin(sender: AnyObject) {

        PFUser.logInWithUsernameInBackground(txtUserName.text, password:txtPassword.text) {
            (user: PFUser!, error: NSError!) -> Void in
            if user != nil {
                // Do stuff after successful login.
                if (user["emailVerified"] as NSObject == true) {
                    self.delegate?.LoginVC_DidLodedIn()
                    
               //     self.dismissViewControllerAnimated(true, completion: nil)
                
                }
                else{
                    var alert = UIAlertView(title: "Authentication Missing", message: "Please verify your email", delegate: nil, cancelButtonTitle: "ok");
                    alert.show()
                }
                
                
            } else {
                
                var alert = UIAlertView(title: "No User", message: "Please Create you self a user ", delegate: nil, cancelButtonTitle: "ok");
                        alert.show()
                // The login failed. Check error to see why.
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     //   myMethod()
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
       
}