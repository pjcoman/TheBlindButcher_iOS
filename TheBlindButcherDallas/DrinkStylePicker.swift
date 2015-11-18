//
//  DrinkStylePicker.swift
//  TheBlindButcherDallas
//
//  Created by me on 11/17/15.
//  Copyright © 2015 me. All rights reserved.
//

class DrinkStylePicker: UIViewController, UIPickerViewDelegate  {
    
    
    
    
    var drinkStyles = [ "IMPORTED BEERS-CANS", "DOMESTIC BEERS-CANS", "IMPORTED BEERS-BOTTLES", "DOMESTIC BEERS-BOTTLES", "IMPORTED BOMBERS", "DOMESTIC BOMBERS", "NITRO DRAFTS", "OTHER BEERS", "DRAFTS", "LOCAL DRAFTS", "COCKTAILS" ]
    
    
    
    
    var drinkStyleToPass = "IMPORTEDBEERSCANS"
    
    
    
    @IBOutlet weak var selectStyleButton: UIButton!
    
    
    @IBOutlet weak var stylePicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        
        
           }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    
    
    
    
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int  {
        
        return 1
        
        
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int  {
        
        return drinkStyles.count
        
        
    }
    
    
    
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
    return drinkStyles[row]
        
            }
    
    
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let styleSelected = self.drinkStyles[row]
        selectStyleButton.enabled = true
        selectStyleButton.hidden = false
        
        drinkStyleToPass = styleSelected.stringByReplacingOccurrencesOfString(" ", withString: "")
        drinkStyleToPass = drinkStyleToPass.stringByReplacingOccurrencesOfString("-", withString: "")
        print(drinkStyleToPass)
        
        
        
    }
    
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        if (segue.identifier == "drinkStyleSelection")  {
            
            (segue.destinationViewController as! DrinksTableViewController).receivedString = drinkStyleToPass
            
            
            
        }
        
        
        
        //   let destinationVC = segue.destinationViewController as! GranadaShowsTableView.receivedString = actStyleToPass
        
        
        // let tableVC = destinationVC.topViewController as! GranadaShowsTableView
        
        
        //     tableVC.receivedString = actStyleToPass
        
        
    }
    
    
    
    
    
}



