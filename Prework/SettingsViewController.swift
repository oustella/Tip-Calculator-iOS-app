//
//  SettingsViewController.swift
//  Prework
//
//  Created by OSL on 12/10/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var userMinTipPerc: UITextField!
    @IBOutlet weak var userMaxTipPerc: UITextField!
    @IBOutlet weak var userDefaultTipPerc: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let destinationVC = segue.destination as! MainView
        
        destinationVC.minTip = Float(userMinTipPerc.text!) ?? 0
        destinationVC.maxTip = Float(userMaxTipPerc.text!) ?? 100
        destinationVC.defaultTip = Float(userDefaultTipPerc.text!) ?? 18
    }
}
