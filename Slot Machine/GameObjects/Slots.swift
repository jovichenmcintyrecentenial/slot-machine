//
//  Slots.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import GameplayKit
import SpriteKit

//todo: make number 117 and 98 relative to screen deminison
class Slots:GameObject{
    
    var slotColums:[SlotColumn] = []
    
    init() {
        super.init(imageString: "slots", initalScale:1.5)
        slotColums.append(SlotColumn())
        slotColums.append(SlotColumn())
        slotColums.append(SlotColumn())
        
        //offset column to negative space for first slot
        var colums:CGFloat = -1

        for slotColumn in slotColums{
            var rows:CGFloat = -1

            for item in slotColumn.items{
                //calculation to space slots horizontally
                item.position.x = 117*colums
                item.position.y = 95*rows

                addChild(item)
                rows = rows + 1
            }
            colums = colums + 1
        }

        start()
        reset()
    }
    
    override func start() {
        for slotColumn in slotColums{
            slotColumn.update()
        }
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
