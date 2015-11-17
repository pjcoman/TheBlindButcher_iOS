//
//  DrinksTableViewController.swift
//  TheBlindButcherDallas
//
//  Created by me on 11/16/15.
//  Copyright © 2015 me. All rights reserved.
//

import UIKit



class DrinksTableViewController: UITableViewController {
    
    let drinkObjects: NSMutableArray! = NSMutableArray()
    
    var receivedString:String!
    

    
    override func viewDidLoad() {
        
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
        
        
        
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
        //   self.fetchAllObjectsFromBackground()
        self.fetchAllObjectsFromParse()
        
        tableView.reloadData()
        
        
    }
    
    
    
    func fetchAllObjectsFromParse()  {
        
        
        
        let query: PFQuery = PFQuery(className: "theblindbutcherdrinks").fromLocalDatastore()
     //   query.orderByAscending("sort").whereKey("group", equalTo: "IMPORTEDBEERSCANS")
        query.orderByAscending("group")
        query.addAscendingOrder("sort")
        query.findObjectsInBackgroundWithBlock{(drinkobjects, error) -> Void in
            
    
        
        for drinkobject in drinkobjects! {
            
            self.drinkObjects.addObject(drinkobject)
            
            }
        
        
        
        self.tableView.reloadData()
        
        
        
        let drinkcount = self.drinkObjects.count
        print("# of drinks \(drinkcount)")
       
        
        }
        
    }
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.drinkObjects.count
        
    }
    
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        tableView.separatorInset = UIEdgeInsetsZero
        
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! DrinkTableViewCell
        
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        cell.layer.shouldRasterize = true
        
        let object: PFObject = self.drinkObjects.objectAtIndex(indexPath.row) as! PFObject
        

        
        cell.itemLabel.text = object["item"] as? String
        
        if (object["abv"] as? Double) != nil {
        
            let abv : String = "\(object["abv"] as! Double)"
            let stringAbv = "A.B.V \(abv)"
            cell.abvLabel!.text = stringAbv } else {
            
            print("A.B.V is nil")
            
            
            
        }
        
        
        if (object["price"] as? String) != nil {
            
            let price : String = "\(object["price"] as! String)"
            cell.priceLabel!.text = price } else {
            
        
            cell.priceLabel!.text = "Ask your server."
            
        }

        
        

        
        
        
        
        return cell
        
    }
    
            
        
    }
    
    
    




