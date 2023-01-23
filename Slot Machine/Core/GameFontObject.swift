//
//  GameFontObject.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

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
