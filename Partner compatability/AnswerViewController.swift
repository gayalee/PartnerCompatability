//
//  AnswerViewController.swift
//  Partner compatability
//
//  Created by gaya lee melo on 31/10/14.
//  Copyright (c) 2014 gaya lee melo. All rights reserved.
//




import UIKit



class AnswerViewController: UIViewController {
    
    var strAnswer : String!
 
    
   // @IBOutlet weak var phoneNumberButton: UIButton!
    
    //@IBOutlet weak var emailAddressButton: UIButton!
    
    @IBAction func backButton(sender: AnyObject) {
        
        self.dismissViewControllerAnimated(true, completion: nil)

    }
    
    
    
    @IBOutlet weak var lblAnswer: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configureUI()
        lblAnswer.text = strAnswer
        
    }
    
//    class func getStoryboardID() -> String{
//        return "BranchDetailsViewController"
//    }
    
    // MARK: - IBActions
    
    @IBAction func mackPhoneCall(sender: AnyObject) {
  //      AppUtils.makePhoneCallToNumber(object.phoneNumber!)
    }
    
  //  var appUtils : AppUtils?
    
    @IBAction func sendEmailAction(sender: AnyObject) {
//        if (appUtils == nil){
//            appUtils = AppUtils()
//        }
//        appUtils!.emailToAddress(object.emailAddress!, fromViewController: self)
    }
    

    


}
