//
//  Slots.swift
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

import GameplayKit
import SpriteKit

enum Slot {case blank,lemon,orange,strawberry,bell,melon,seven,cherry,grape}

//todo: make number 117 and 98 relative to screen deminison
class Slots:GameObject{
    
    var slotColums:[SlotColumn] = []
    var isSpinning:Bool = false
    
    init() {
        super.init(imageString: "slots", initalScale:1.5)
        
        //create 3 column objects for each slot
        slotColums.append(SlotColumn(columnIndex: 0))
        slotColums.append(SlotColumn(columnIndex: 1))
        slotColums.append(SlotColumn(columnIndex: 2))
        
       adjustSlots(add: true)

        start()
        reset()
    }
    
    //function use to position each slot items in correct location
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
                
                //calculate where slot that has pass resetCutOffPoint should move to
                if( index == slotColumn.items.count-1){
                    slotColumn.restPoint = 95*(rows+1)
                }
                //save a cut off point where slot item with the move to restpoint to similate continues spinning
                else if(index == 0){
                    slotColumn.resetCutOffPoint = item.position.y
                }
                
                //add slot to parent
                if(add){
                    slotColumn.positions.append(CGPoint(x: item.position.x , y: item.position.y))
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
    
    //spin logic to start reel spin
    func spin(){
        isSpinning = true
        DispatchQueue.global().async { [weak self] in

            //trigger spin with a delay on each reels so they don't start trigger the same time
            if self != nil {

                for slotColumn in self!.slotColums {
                    slotColumn.stopSlot = nil
                    slotColumn.verticalSpeed = -5
                    slotColumn.isSpinning = true
                    usleep(50_000)

                    
                }
            }
        }
    }
    
    
    //function use to indicate to slotcolumn when to stop spinning and at what slot items
    func stop(slots:[Slot],onComplete:@escaping ()->Void){
        DispatchQueue.global().async { [weak self] in
       

            //trigger stop
            if self != nil {
                //sleep to allow reel to spin for a awhile
                usleep(1500_000)

                //realign slots
                self!.adjustSlots(add: false)
                usleep(500_000)
                
                var index = 0
                for slotColumn in self!.slotColums{
                    //tell slot column to stop on a particular slot
                    slotColumn.stop(at: slots[index])
                    
                    //delayed effect to make reel stop one at a time
                    usleep(550_000)

                    index += 1
                    
                }
                DispatchQueue.main.async {
                    onComplete()
                }
                self!.isSpinning = false

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
