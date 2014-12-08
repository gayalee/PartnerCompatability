
//
//  ArticleViewController.swift
//  Partner compatability
//
//  Created by gaya lee melo on 06/11/14.
//  Copyright (c) 2014 gaya lee melo. All rights reserved.
//

import UIKit


class ArticleViewController: BaseViewController,RequestHandler_DELEGATE {

    var arrObjects : NSArray!
    
    var request : RequestHandler?

    
    @IBOutlet weak var tblArticlenName: UITableView!
    
    
         override func viewDidLoad() {
        super.viewDidLoad()

            request = RequestHandler(delegate: self);
            request?.requestArticals();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    // returning the numberr of rows
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrObjects == nil {
            return 0
        }
        return arrObjects.count
    }
   
    // showing the articals names
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
       
        var object: PFObject
        object = arrObjects[indexPath.row] as PFObject
        
        cell.textLabel?.text = object["Name"] as String!
        
        cell.textLabel?.textAlignment = NSTextAlignment.Right
        cell.textLabel?.adjustsFontSizeToFitWidth=true
    
        return cell
    }
    

  
    // catching users selection and sending in selected articale
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        var object: PFObject
        object = arrObjects[indexPath.row] as PFObject
        self.performSegueWithIdentifier("segueToText", sender: object["Article_Desc"])
    }
    
    
    
    // navigation metode
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "segueToText")
        {
            // creating an instance of SelectedArticalVC and passing astring of the artical
            var artVc = segue.destinationViewController as SelectedArticalVC
            artVc.strArtical = sender as String
            
        }
    }
    
    
    // rfequest handler dalegate
    
    func RequestHandler_DidGetResoult(arr:NSArray){
        
        self.arrObjects = arr
        self.tblArticlenName.reloadData()

        
    }
    
}
