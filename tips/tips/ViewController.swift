//
//  ViewController.swift
//  tips
//
//  Created by Mishra, Yashwita on 3/5/17.
//  Copyright © 2017 Mishra, Yashwita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaults.synchronize()
        self.tipControl.selectedSegmentIndex=defaults.integer(forKey: "savedPercentage")
        print(defaults.integer(forKey: "savedPercentage"));
        
        calculateTip(Any.self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        defaults.synchronize()
        self.tipControl.selectedSegmentIndex=defaults.integer(forKey: "savedPercentage")
        print(defaults.integer(forKey: "savedPercentage"));
        
        calculateTip(Any.self)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        
        tipLabel.text=String(format: "$%.2f", tip)
        totalLabel.text=String(format: "$%.2f", total)
    }

    @IBAction func onPercentageSwitch(_ sender: Any) {
        calculateTip(Any.self)
    }
}

