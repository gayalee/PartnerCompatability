//
//  RequestHandler.swift
//  Partner compatability
//
//  Created by gaya lee melo on 28/11/14.
//  Copyright (c) 2014 gaya lee melo. All rights reserved.
//

import UIKit

// creating protocol to SEND BACK RELEVENT DATA
protocol RequestHandler_DELEGATE{
    func RequestHandler_DidGetResoult(arr:NSArray)
    
}


class RequestHandler {
    
    var delegate : RequestHandler_DELEGATE?
    
    init(delegate: RequestHandler_DELEGATE) {
        self.delegate = delegate
    }

    func requestArticals(){
        // creating a query to fetch all data from specific class
        var query = PFQuery(className:"Articles")
        
        query.findObjectsInBackgroundWithBlock {
            (list: [AnyObject]!, error: NSError!) -> Void in
            if error == nil {
                // The find succeeded.
                NSLog("Successfully retrieved \(list.count) articles.")
                // Do something with the found objects
                
                self.delegate?.RequestHandler_DidGetResoult(list)

            } else {
                // Log details of the failure
                NSLog("Error: %@ %@", error, error.userInfo!)
            }
        }

    }

}
