//
//  SelectedArticalVC.swift
//  Partner compatability
//
//  Created by Udi on 07/11/14.
//  Copyright (c) 2014 gaya lee melo. All rights reserved.
//

import UIKit

class SelectedArticalVC: BaseViewController {

    var strArtical : String!
    
//   @IBAction func backButton(sender: AnyObject) {
//        self.dismissViewControllerAnimated(true, completion: nil)
//        
//    }
   
    @IBOutlet weak var txtArtical: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtArtical.text = strArtical
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
