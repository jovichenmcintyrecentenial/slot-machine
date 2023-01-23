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
        
        //create 3 column objects for each slot
        slotColums.append(SlotColumn())
        slotColums.append(SlotColumn())
        slotColums.append(SlotColumn())
        
        //offset column to negative space for first slot
        var colums:CGFloat = -1
        for slotColumn in slotColums{
            //off row to negative for row item
            var rows:CGFloat = -3
            var index = 0

            for item in slotColumn.items{
                //calculation position of slot item
                item.position.x = 117*colums
                item.position.y = 95*rows
                
                if( index == slotColumn.items.count-1){
                    slotColumn.restPoint = 95*(rows+1)
                }
                else if(index == 0){
                    slotColumn.resetCutOffPoint = item.position.y
                }
                
                //add slot to parent
                addChild(item)
                //shift row
                rows = rows + 1
                index = index + 1
            }
            //shift column
            colums = colums + 1
        }

        start()
        reset()
    }
    
    override func start() {
        //run function to hide slot items that has pass speficied bounds
        for slotColumn in slotColums{
            slotColumn.update()
        }
    }
    
    override func update() {
        for slotColumn in slotColums{
            slotColumn.update()
        }
    }
    
    override func reset() {
        zPosition = 0

    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
