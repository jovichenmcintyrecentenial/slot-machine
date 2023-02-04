//
//  SlotItem.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import Foundation

class SlotItem:GameObject{

    var slot:Slot
    init(itemName:String,slot:Slot) {
        self.slot = slot
        super.init(imageString: itemName, initalScale:0.60)
        start()
        reset()
    }
    
    override func start() {
  
    }
    
    override func update() {
    }
    
    override func reset() {
        zPosition = 3
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
