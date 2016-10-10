//
//  SettingsViewController.swift
//  tippr
//
//  Created by andy_chen on 10/10/16.
//  Copyright © 2016 bob inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

  @IBOutlet weak var segmentControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      let defaults = UserDefaults.standard
      let intValue = defaults.integer(forKey: "default_tip_index")
      segmentControl.selectedSegmentIndex = intValue
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  @IBAction func didChangeDefaultTip(_ sender: AnyObject) {
    let defaults = UserDefaults.standard
    defaults.set(segmentControl.selectedSegmentIndex, forKey: "default_tip_index")
    defaults.synchronize()
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
