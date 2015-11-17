//
//  ViewController.swift
//  TheBlindButcherDallas
//
//  Created by me on 11/16/15.
//  Copyright © 2015 me. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {
    
    var drinkObjects: NSMutableArray! = NSMutableArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
            
        let query = PFQuery(className: "theblindbutcherdrinks")
            query.limit = 200
            query.findObjectsInBackgroundWithBlock {
                (drinks: [PFObject]?, error: NSError?) -> Void in
                
                if error == nil {
                    print("Received \(drinks!.count) drinks.")
                    if let drinks = drinks as [PFObject]! {
                        for drink in drinks {
                            print(drink.objectId)
                            
                            self.drinkObjects.addObject(drink)
                        }
                        
                        PFObject.pinAllInBackground(drinks, block: nil)
                        PFObject.saveAllInBackground(drinks, block: nil)
                        
                    }
                    
                } else {
                    print("Error \(error!) \(error!.userInfo)")
                }
            }
            
            
        }
        
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

