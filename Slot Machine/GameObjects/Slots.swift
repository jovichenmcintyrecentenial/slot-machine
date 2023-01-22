//
//  Slots.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import GameplayKit
import SpriteKit


class Slots:GameObject{

    
    init() {
        super.init(imageString: "slots", initalScale: 1.5)
        start()
        reset()
    }
    
    override func start() {
  
    }
    
    override func update() {
    }
    
    override func reset() {
        zPosition = 0
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
