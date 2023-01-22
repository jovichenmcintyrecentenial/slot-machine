//
//  SlotMachine.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import GameplayKit
import SpriteKit


class SlotMachine:GameObject{

    
    init() {
        super.init(imageString: "slot-machine", initalScale: 0.75)
        start()
        reset()
    }
    
    override func start() {
  
    }
    
    override func update() {
    }
    
    override func reset() {
//        position.y = 2107
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
