//
//  ViewController.swift
//  tippr
//
//  Created by andy_chen on 10/10/16.
//  Copyright © 2016 bob inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var totalView: UIView!
  @IBOutlet weak var billField: UITextField!
  @IBOutlet weak var tipLabel: UILabel!
  @IBOutlet weak var totalLabel: UILabel!
  @IBOutlet weak var segmentControl: UISegmentedControl!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.billField.becomeFirstResponder()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    let defaults = UserDefaults.standard
    let intValue = defaults.integer(forKey: "default_tip_index")
    segmentControl.selectedSegmentIndex = intValue
    billField.text = ""
    didChangeBill(self)

    totalView.isHidden = true

    let screenRect = UIScreen.main.bounds
    let screenWidth = screenRect.size.width;
    totalView.frame = CGRect(origin: CGPoint(x: screenWidth, y: totalView.frame.origin.y), size: totalView.bounds.size)

  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func didTapView(_ sender: AnyObject) {
//    view.endEditing(true);
  }

  @IBAction func didChangeBill(_ sender: AnyObject) {
    if totalView.isHidden {
      self.totalView.isHidden = false
      UIView.animateKeyframes(withDuration: 0.5,
                                delay: 0,
                                options: UIViewKeyframeAnimationOptions.calculationModeLinear,
                                animations: {
                                  self.totalView.frame = CGRect(origin: CGPoint(x: 0, y: self.totalView.frame.origin.y), size: self.totalView.bounds.size)

                                },
                                completion: nil)
    }


    let percentages = [0.18, 0.2, 0.3];
    let bill = Double(billField.text!) ?? 0
    let tip = bill * percentages[segmentControl.selectedSegmentIndex]
    let total = tip + bill
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = NSLocale.current.currencyCode

    let convertedTip = formatter.string(from: NSNumber(value: tip))
    let convertedTotal = formatter.string(from: NSNumber(value: total))

    tipLabel.text = String(format: "%@", convertedTip!)
    totalLabel.text = String(format: "%@", convertedTotal!)
  }
}

