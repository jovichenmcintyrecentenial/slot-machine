//
//  SlotMachine.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import GameplayKit
import SpriteKit


class SlotMachine:GameObject{
//    var slots:Slots?

    
    init() {
        super.init(imageString: "slot-machine", initalScale: 0.75)
        zPosition = 10

        start()
        reset()
//        slots = Slots()
//        addChild(slots!)
    }
    
    override func start() {
  
    }
    
    override func update() {
    
    }
    
    override func reset() {
        zPosition = 100
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
