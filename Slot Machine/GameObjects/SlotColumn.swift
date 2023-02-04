//
//  SlotColumn.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import CoreFoundation


class SlotColumn{
    
    //use to clipp image from view when not in slot machine display
    var upperBoundCutOff:CGFloat = 200
    var lowerBoundCutOff:CGFloat = -200
    var resetCutOffPoint:CGFloat = -10000
    var restPoint:CGFloat = 10000
    var stopSlot:Slot? = nil
    var isSpinning = false
    
    //current speed
    var verticalSpeed:CGFloat = 0
    //max speed wheels can go
    var vertialMaxSpeed:CGFloat = 20
    
    var items:[SlotItem] = []

    init() {
        //load different slot items
        items.append(SlotItem(itemName: "cherry",slot: Slot.cherry))
        items.append(SlotItem(itemName: "seven",slot: Slot.seven))
        items.append(SlotItem(itemName: "melon",slot: Slot.melon))
        items.append(SlotItem(itemName: "bell",slot: Slot.bell))
        items.append(SlotItem(itemName: "strawberry",slot: Slot.strawberry))
        items.append(SlotItem(itemName: "grape",slot: Slot.grape))
        items.append(SlotItem(itemName: "orange",slot: Slot.orange))
        items.append(SlotItem(itemName: "lemon",slot: Slot.lemon))
        items.append(SlotItem(itemName: "blank",slot: Slot.blank))

    }
    
    func stop(at:Slot){
        stopSlot = at
    }
    

    
    func update(){
        
        //use to simulate acceleration
        if(verticalSpeed < vertialMaxSpeed && isSpinning){
            verticalSpeed = verticalSpeed + 1
        }
    
        var index = 0
        for item in items{
            
            //this check is use to make sprite invisible when the pass a certain point on screen
            if(item.position.y < lowerBoundCutOff || item.position.y > upperBoundCutOff)
            {
                item.isHidden = true
            }
            else{
                item.isHidden = false
            }
            item.position.y = item.position.y - verticalSpeed
            
        
            //reset slot item if there pass a certain point so well looks continious
            if(item.position.y < resetCutOffPoint){
                item.position.y = restPoint
            }
            
            //check if should stop then stop at betline position
            if(stopSlot != nil && item.slot == stopSlot && item.position.y >= 0 && item.position.y <= 20){
                isSpinning = false
                verticalSpeed = 0
            }
            
            index = index + 1
        }
    }
    

}
