//
//  SettingsViewController.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 03/09/19.
//  Copyright © 2019 FIAP. All rights reserved.
//

import UIKit

struct Keys {
    static let color = "color"
    static let autoplay = "autoplay"
    static let category = "category"
}

class SettingsViewController: UIViewController {

    @IBOutlet weak var swAutoplay: UISwitch!
    @IBOutlet weak var tfCategory: UITextField!
    @IBOutlet weak var scColors: UISegmentedControl!
    
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        swAutoplay.setOn(ud.bool(forKey: Keys.autoplay), animated: true)
        scColors.selectedSegmentIndex = ud.integer(forKey: Keys.color)
        tfCategory.text = ud.string(forKey: Keys.category)
    }
    
    @IBAction func changeAutoplay(_ sender: UISwitch) {
        ud.set(sender.isOn, forKey: Keys.autoplay)
        ud.synchronize()
    }
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        ud.set(sender.selectedSegmentIndex, forKey: Keys.color)
        ud.synchronize()
    }
}

extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        ud.set(textField.text, forKey: Keys.category)
        return true
    }
}
