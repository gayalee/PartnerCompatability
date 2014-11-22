//
//  ViewController.swift
//  Partner compatability
//
//  Created by gaya lee melo on 28/09/14.
//  Copyright (c) 2014 gaya lee melo. All rights reserved.
//

import UIKit



class ViewController: UIViewController ,UITextFieldDelegate {
 
  let heb_Alef:String = "א"
  let heb_bet:String = "ב"
  let heb_gimel:String = "ג"
  let heb_daled:String = "ד"
  let heb_hey:String = "ה"
  let heb_vav:String = "ו"
  let heb_zan:String = "ז"
  let heb_het:String = "ח"
  let heb_tet:String = "ט"
  let heb_yud:String = "י"
  let heb_kaf:String = "כ"
  let heb_lamed:String = "ל"
  let heb_mem:String = "מ"
  let heb_nun:String = "נ"
  let heb_sameh:String = "ס"
  let heb_ain:String = "ע"
  let heb_pey:String = "פ"
  let heb_zadik:String = "צ"
  let heb_kuf:String = "ק"
  let heb_reish:String = "ר"
  let heb_shin:String = "ש"
  let heb_taf:String = "ת"
    
    
    let m_maim:String = "מים"
    let m_adama:String = "אדמה"
    let m_esh:String = "אש"
    let m_avir:String = "אוויר"
    
   // var vc2 : AnswerViewController!
    
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtSecondName: UITextField!
    
    
    @IBOutlet weak var btnCalculate: UIButton!
    @IBAction func actCalculate(sender: AnyObject)
    {
        
        // checking if the user wrote text ...
        if ( txtFirstName.text == "" || txtSecondName.text == "")
        {
            
            
            var alert = UIAlertView(title: "שגיאה", message: "חסר טקסט", delegate: nil, cancelButtonTitle: "סגור")
            alert.show()
            
            return
        }
        
        let firstUser = calculateString(txtFirstName.text)
        let secondUser = calculateString(txtSecondName.text)
        
        var dict = [
            1:m_maim,
            2:m_adama,
            3:m_esh,
            4:m_avir,
            5:m_maim,
            6:m_adama,
            7:m_esh,
            8:m_avir,
            9:m_maim,
            10:m_adama,
            11:m_esh,
            12:m_avir,
            
            
            
        ]
        
        var str1 = dict[firstUser]
        var str2 = dict[secondUser]
        

        
        var totzaa :Bool = false
        
        if str1 == m_maim{
            
            if str2 == m_maim || str2 == m_adama || str2 == m_esh
            {
                totzaa = true
            }else{
                totzaa = false
            }
        }
        
        
        if str1 == m_adama{
            
            if str2 == m_maim || str2 == m_adama
            {
                totzaa=true
            }else{
                totzaa=false
            }
            
        }

        if str1 == m_esh{
            
            if str2 == m_maim || str2 == m_esh || str2 == m_adama
            {
                totzaa=true
            }else{
                totzaa=false
            }
            
        }
        
        if str1 == m_avir{
            
            if str2 == m_esh
            {
                totzaa=true
            }else{
                totzaa=false
            }
            
        }

        if totzaa{
           self.performSegueWithIdentifier("segue_to_end", sender: "good cuple")
        }
        else
        {
            self.performSegueWithIdentifier("segue_to_end", sender: "bad cuple")
        }
        
        
        
        println("the value for the first text is :   \(firstUser) , the value for the second text is :   \(secondUser)")
        
    
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        // println("segue name \(segue.identifier)");
        if (segue.identifier=="segue_to_end"){
            
            var str : String = sender as String
            
            
            var vc3 = segue.destinationViewController as AnswerViewController
            vc3.strAnswer = str
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        addBorder(btnCalculate, color: (UIColor .blackColor()), borderWidth: 1)
       // moveSomeView(btnCalculate, rect: CGRect(x: 80, y: 20, width: btnCalculate.frame.size.width, height: btnCalculate.frame.size.height))
        
      //  moveSomeView(btnCalculate)
        
        
       }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func calculateString(str:String) -> Int {
        
        let dict = [
            heb_Alef:1,
            heb_bet:2,
            heb_gimel:3,
            heb_daled:4,
            heb_hey:5,
            heb_vav:6,
            heb_zan:7,
            heb_het:8,
            heb_tet:9,
            heb_yud:1,
            heb_kaf:2,
            heb_lamed:3,
            heb_mem:4,
            heb_nun:5,
            heb_sameh:6,
            heb_ain:7,
            heb_pey:8,
            heb_zadik:9,
            heb_kuf:1,
            heb_reish:2,
            heb_shin:3,
            heb_taf:4,
        
        ]
        
        var sum = 0
        
        // passing throgh all the characters in each string and makes sumarize
        for carecter in str
        {
            println("\(carecter)")
            
            var str = String()
            
            str.append(carecter)// func append adds string/charecter
            
            sum+=dict[str]!
            
        }
        
        while sum > 13 {
            sum = sum - 12
        }
        
        
        
        return sum
    }
    

    // checking each char and preventing from the user to enter char's that are not hebrew
  
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        if txtFirstName==textField{
            println("first")
        }
        else
        {
        println("second ")
        }
        
        var charSet = NSCharacterSet(charactersInString: "אבגדהוזחטיכלמנסעפצקרשת")
        var givenChar = NSCharacterSet(charactersInString: string)
        
        if   ( charSet.isSupersetOfSet(givenChar) )
        {
        return true
        }
        
        
        
        return false
    }
  
    
    // move method to specific coordinate
    func moveSomeView(view:UIView){
      
     
        
      
          var rect = CGRect(x: 100, y: 100, width: 200 , height: 200)
        
        UIView.animateWithDuration(2, delay: 1.0, options: .CurveEaseOut, animations: {
            view.frame=rect;
            
            }, completion: { finished in
                
                rect=CGRect(x: 0, y: 350, width: 10, height: 10);
                
                
                UIView.animateWithDuration(2, animations: {
                 view.frame=rect
                })
                
               
                
                println("animation Ended")
        })
        
        
        
    }
    
    // mode method to declared coordinate
    func moveSomeView(view:UIView,rect:CGRect){
     
        UIView.animateWithDuration(0.7, delay: 1.0, options: .CurveEaseOut, animations: {
            view.frame=rect
            }, completion: { finished in
                println("animation Ended")
        })
    }
    
    
    // add specific border
    func addBorderToView(view:UIView){
        view.layer.borderColor = (UIColor .redColor()).CGColor
        
        view.layer.borderWidth=2.0;
        (UIColor .redColor())
    }
    
    
    // adds declared border to view
    func addBorder(view:UIView,color:UIColor,borderWidth:CGFloat ){
        view.layer.borderColor=color.CGColor
        view.layer.borderWidth=borderWidth
        view.layer.cornerRadius=4;
        
    }
    
}




