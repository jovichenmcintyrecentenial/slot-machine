//
//  SlotColumn.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import CoreFoundation


class SlotColumn{
    
    //use to clipp image from view when not in slot machine display
    var upperBoundCutOff:CGFloat = 100
    var lowerBoundCutOff:CGFloat = -150
    var resetPoint = -140

   var items:[SlotItem] = []
    
    init() {
        
        items.append(SlotItem(itemName: "cherry"))
        items.append(SlotItem(itemName: "seven"))
        items.append(SlotItem(itemName: "melon"))
        items.append(SlotItem(itemName: "bell"))
        items.append(SlotItem(itemName: "strawberry"))
        items.append(SlotItem(itemName: "grape"))
        items.append(SlotItem(itemName: "orange"))
        items.append(SlotItem(itemName: "strawberry"))
        items.append(SlotItem(itemName: "melon"))
        items.append(SlotItem(itemName: "lemon"))
        items.append(SlotItem(itemName: "somefruitidk"))

    }
    
    func update(){
        for item in items{
            if(item.position.y < lowerBoundCutOff || item.position.y > upperBoundCutOff)
            {
                item.isHidden = true
            }
            else{
                item.isHidden = false
            }
            
        }
    }
    

}
