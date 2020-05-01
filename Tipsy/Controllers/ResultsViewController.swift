//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Mark Patrick Perdon on 4/30/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tipTotal = ""
    var splitWith = ""
    var percent = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = tipTotal
        settingsLabel.text = "Split between \(splitWith) people, with \(percent)% tip."
        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
