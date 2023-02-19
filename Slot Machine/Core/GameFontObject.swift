//
//  GameFontObject.swift
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

import Foundation
import SpriteKit

class GameFontObject:SKLabelNode{
    
    override init() {
        super.init()
    }
    
    init(fontSize:CGFloat) {
        super.init(fontNamed: "Baloo-Regular")
        self.self.fontSize = fontSize
        zPosition = 120200202020202
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
