//
//  TipViewController.swift
//  BigTipper
//
//  Created by Curtis Wilcox on 3/3/17.
//  Copyright © 2017 DevFountain LLC. All rights reserved.
//

import TinyConstraints
import TwicketSegmentedControl
import UIKit

class TipViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    var tipSegmentedControl = TwicketSegmentedControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        Tip.getPercentages()

        if Settings.billAmount != "" {
            billTextField.text = Settings.billAmount
            calculateTip(self)
        }

        tipSegmentedControl.delegate = self

        tipSegmentedControl.backgroundColor = UIColor(red: 0, green: 122, blue: 255, alpha: 1)
        tipSegmentedControl.frame = CGRect(x: 16, y: 141, width: view.frame.width - 32, height: 29)
        tipSegmentedControl.setSegmentItems(Tip.titles)

        view.addSubview(tipSegmentedControl)

        tipSegmentedControl.top(to: billTextField, billTextField.bottomAnchor, offset: 26)
        tipSegmentedControl.left(to: view)
        tipSegmentedControl.right(to: view)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipSegmentedControl.move(to: Settings.defaultTipPercent)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        billTextField.becomeFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        billTextField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        billTextField.resignFirstResponder()
    }

    @IBAction func calculateTip(_ sender: Any) {
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * Tip.percentages[tipSegmentedControl.selectedSegmentIndex].value
        let total = bill + tip

        let currencyFormatter = NumberFormatter()
        currencyFormatter.locale = Locale.current
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        currencyFormatter.numberStyle = NumberFormatter.Style.currency
        currencyFormatter.usesGroupingSeparator = true

        tipLabel.text = currencyFormatter.string(from: NSNumber(value: tip))
        totalLabel.text = currencyFormatter.string(from: NSNumber(value: total))

        Settings.billAmount = billTextField.text!
    }

}

extension TipViewController: TwicketSegmentedControlDelegate {

    func didSelect(_ segmentIndex: Int) {
        calculateTip(self)
    }

}

