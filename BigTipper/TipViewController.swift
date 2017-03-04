//
//  TipViewController.swift
//  BigTipper
//
//  Created by Curtis Wilcox on 3/3/17.
//  Copyright © 2017 DevFountain LLC. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipSegmentedControl: UISegmentedControl!

    static var tipPercentPickerData = [TipPercent]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let fifteen = TipPercent(title: "15%", value: 0.15)
        TipViewController.tipPercentPickerData.append(fifteen)

        let twenty = TipPercent(title: "20%", value: 0.20)
        TipViewController.tipPercentPickerData.append(twenty)

        let twentyFive = TipPercent(title: "25%", value: 0.25)
        TipViewController.tipPercentPickerData.append(twentyFive)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipSegmentedControl.selectedSegmentIndex = Settings.defaultTipPercent
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * TipViewController.tipPercentPickerData[tipSegmentedControl.selectedSegmentIndex].value
        let total = bill + tip

        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

}

