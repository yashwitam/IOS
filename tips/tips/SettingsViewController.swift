//
//  SettingsViewController.swift
//  tips
//
//  Created by Mishra, Yashwita on 3/6/17.
//  Copyright © 2017 Mishra, Yashwita. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var selectedPercentage: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    let savedPercentage = "savedPercentage"
    
    @IBAction func savePercentage(_ sender: Any) {
        
        
        defaults.setValue(selectedPercentage.selectedSegmentIndex,forKey: savedPercentage )
        defaults.synchronize()
        
         print(defaults.integer(forKey: "savedPercentage"))
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaults.synchronize()
        self.selectedPercentage.selectedSegmentIndex=defaults.integer(forKey: "savedPercentage")
        print(defaults.integer(forKey: "savedPercentage"));
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        defaults.synchronize()
        self.selectedPercentage.selectedSegmentIndex=defaults.integer(forKey: "savedPercentage")
        print(defaults.integer(forKey: "savedPercentage"));
    }


    override func viewDidLoad() {
        super.viewDidLoad()
         defaults.synchronize()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
