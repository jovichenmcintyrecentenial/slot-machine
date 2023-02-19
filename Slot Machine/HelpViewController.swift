//
//  HelpViewController.swift
//  Slot Machine
//
//  Created by Jovi on 19/02/2023.
//

import UIKit

class HelpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClosePressed(_ sender: Any) {
        Notifications.emit(value: .closeHelp)
    }
    
}
