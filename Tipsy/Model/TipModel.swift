//
//  CalculateTip.swift
//  Tipsy
//
//  Created by Mark Patrick Perdon on 5/1/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipModel{
    
    func getBill(from billValue: String?) -> Float{
        if let billValue = billValue{
            let convertBill = (billValue as NSString).floatValue
            return convertBill
        }else{
            return 0.00
        }
    }
    
    func getPercentage(from selectedPct: String?) -> Float{
        if let selectedPct = selectedPct {
            let percentage = (selectedPct as NSString).floatValue / 100
            return percentage
        }else{
            return 0.00
        }
    }
    
    func getSplitNumber(from splitVal: Double) -> Double{
        return splitVal
    }
    
    func calculateWith(percentage: Float, billAmount: Float, splitWith: Float) -> Float{
        let tipAmount = percentage * billAmount
        let tipPerPerson = (tipAmount + billAmount) / splitWith
        
        return tipPerPerson
    }
}
