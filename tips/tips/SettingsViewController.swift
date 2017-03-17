//
//  SettingsViewController.swift
//  tips
//
//  Created by Mishra, Yashwita on 3/6/17.
//  Copyright © 2017 Mishra, Yashwita. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipLabel: UILabel!
    
    @IBOutlet weak var selectedPercentage: UISegmentedControl!
    
    let defaults = UserDefaults.standard
    let savedPercentage = "savedPercentage"
    
    
    @IBAction func savePercentage(_ sender: Any) {
        
        
        defaults.setValue(selectedPercentage.selectedSegmentIndex,forKey: savedPercentage )
        defaults.synchronize()
        
        print(defaults.integer(forKey: "savedPercentage"))
        
        
        
        let index = self.defaults.integer(forKey: "savedPercentage")
        
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 30, options: [], animations: {
            
            if(index == 0){
                
                self.defaultTipLabel.text="Great!!"
                 self.view.backgroundColor = UIColor.green
                
            }else if(index == 1){
                
                self.defaultTipLabel.text="Excellent!!"
                self.view.backgroundColor = UIColor.lightGray

                
            }else if(index == 2){
                
                self.defaultTipLabel.text="You are the best!!"
                self.view.backgroundColor = UIColor.yellow
            }
            self.defaultTipLabel.center.x = self.view.frame.width / 2
            
        }, completion: nil)
        
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
