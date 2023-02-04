//
//  Slots.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import GameplayKit
import SpriteKit

enum Slot {case blank,lemon,orange,strawberry,bell,melon,seven,cherry,grape}

//todo: make number 117 and 98 relative to screen deminison
class Slots:GameObject{
    
    var slotColums:[SlotColumn] = []
    
    init() {
        super.init(imageString: "slots", initalScale:1.5)
        
        //create 3 column objects for each slot
        slotColums.append(SlotColumn())
        slotColums.append(SlotColumn())
        slotColums.append(SlotColumn())
        
       adjustSlots(add: true)

        start()
        reset()
    }
    
    func adjustSlots(add:Bool = false){
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
                if(add){
                    addChild(item)
                }
                //shift row
                rows = rows + 1
                index = index + 1
            }
            //shift column
            colums = colums + 1
        }
    }
    
    func spin(){
        DispatchQueue.global().async { [weak self] in

            //trigger spin
            if self != nil {
//                self!.adjustSlots()

                for slotColumn in self!.slotColums{
                    slotColumn.stopSlot = nil
                    slotColumn.verticalSpeed = -10
                    slotColumn.isSpinning = true
                    usleep(50_000)
                    
                }
            }
        }
    }
    
    func stop(slots:[Slot],onComplete:@escaping ()->Void){
        DispatchQueue.global().async { [weak self] in
            usleep(2000_000)

            //trigger stop
            if self != nil {
                var index = 0
                for slotColumn in self!.slotColums{
                    slotColumn.stop(at: slots[index])
                    usleep(550_000)
                    index += 1
                    
                }
                
                onComplete()
            }
        }
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
