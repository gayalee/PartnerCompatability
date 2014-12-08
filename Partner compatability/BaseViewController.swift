//
//  BaseViewController.swift
//  Partner compatability
//
//  Created by gaya lee melo on 28/11/14.
//  Copyright (c) 2014 gaya lee melo. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    @IBAction func actBackButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
}
