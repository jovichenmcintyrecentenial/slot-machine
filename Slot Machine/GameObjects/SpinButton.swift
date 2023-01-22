//
//  SpinButton.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import Foundation
import UIKit

class SpinButton:GameObject{

    var isEnabled = true
    
    init(_ frame:CGRect) {
        super.init(imageString: "spin-button", initalScale:0.5)
        start()
        //position spin button
        position.y = (-1*frame.size.height/2)+(texture?.size().height)!/2
        zPosition = 1000000

    }
    
    override func start() {
  
    }
    
    override func update() {
    }
    
    override func reset() {
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}