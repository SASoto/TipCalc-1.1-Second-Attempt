//
//  ViewController.swift
//  TipTap 1.1
//
//  Created by Saul Soto on 12/14/15.
//  Copyright © 2015 CodePath - Saul Soto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billfield: UITextField!
    @IBOutlet weak var tiplabel: UILabel!
    @IBOutlet weak var totallabel: UILabel!
    
    @IBOutlet weak var tipcontrol: UISegmentedControl!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        tiplabel.text = "$0.00"
        totallabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func OnEditingChanged(sender: AnyObject)
    {
        var tippercent = [0.18, 0.2, 0.22]
        var tippercentspec = tippercent[tipcontrol.selectedSegmentIndex]
        
        var billamount = NSString(string: billfield.text!).doubleValue
        var tip = billamount * tippercentspec
        var total = billamount + tip
        
        tiplabel.text = "\(tip)"
        totallabel.text = "\(total)"
        
        tiplabel.text = String(format: "$%.2f", tip)
        totallabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func ontap(sender: AnyObject)
    {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let tippercent = defaults.doubleForKey("default_tip_percentage")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

}

