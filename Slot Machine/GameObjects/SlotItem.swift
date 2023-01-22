//
//  SlotItem.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import Foundation

class SlotItem:GameObject{

    
    init(itemName:String) {
        super.init(imageString: itemName, initalScale:1.2)
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
