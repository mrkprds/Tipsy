//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var twentyPctBtn: UIButton!
    @IBOutlet weak var numberOfPeople: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    var selectedPct:Float    = 0.00
    var billValue:Float      = 0.00
    var splitNumber:Float    = 2.0
    var tipTotal:Float       = 0.00

    var tip = TipModel()
    
    func updateStepperValue(){
        splitNumber         = Float(tip.getSplitNumber(from: stepper.value))
        numberOfPeople.text = String(format: "%.0f", splitNumber )
    }
    
    func deselectAllBTn(){
        [zeroPctBtn, tenPctBtn, twentyPctBtn ].forEach{
            $0?.isSelected = false
        }
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        deselectAllBTn()
        sender.isSelected = true
        selectedPct       = tip.getPercentage(from: sender.currentTitle)
        billTextField.endEditing(true)
   }
   
   @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateStepperValue()
        billTextField.endEditing(true)
   }
   
   @IBAction func calculatePressed(_ sender: UIButton) {
        billValue   = tip.getBill(from: billTextField.text)
        tipTotal    = tip.calculateWith(percentage: selectedPct,
                                        billAmount: billValue,
                                        splitWith: splitNumber)
    
    self.performSegue(withIdentifier: "performCalculation", sender: self)
    
   }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "performCalculation" {
            let resultsVC        = segue.destination as! ResultsViewController
            resultsVC.tipTotal   = String(tipTotal)
            resultsVC.splitWith  = String(format: "%.0f", splitNumber)
            resultsVC.percent    = String(format: "%.0f", selectedPct * 100)
        }
    }
}

