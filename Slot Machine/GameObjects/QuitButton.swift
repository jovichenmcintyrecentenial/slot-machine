//
//  QuitButton.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import Foundation
import UIKit
import SpriteKit

class QuitButton:GameObject{
    
    init(_ frame:CGRect) {
        super.init(imageString: "quit", initalScale:0.75)
        
        start()
        //position spin button
        position.y = frame.height/2 * 0.85
        position.x = frame.width/2 * 0.70
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
