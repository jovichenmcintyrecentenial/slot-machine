//
//  QuitButton.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//
//  GROUP NUMBER: 20
//  NAMES:
//  Clinton Nwadiukor  - 301291242
//  Jovi Chen-Mcintyre - 301125059
//
//  DESCRIPTION:
//  Slot Machine application for iOS. Users can place bets, spin and either win or lose
//
//  REVISION HISTORY:
//  https://github.com/jovichenmcintyrecentenial/slot-machine
//
//  DATE LAST MODIFIED:
//  Feburay 19, 2022

import Foundation
import UIKit
import SpriteKit

class UIToolbarButton:GameObject{
    
    init(imageName:String,xOffset:CGFloat = 0,_ frame:CGRect) {
        super.init(imageString: imageName, initalScale:0.75)
        
        start()
        //position spin button
        position.y = frame.height/2 * 0.85
        position.x = frame.width/2 * 0.70
        position.x += xOffset 
        zPosition = 10000000

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
