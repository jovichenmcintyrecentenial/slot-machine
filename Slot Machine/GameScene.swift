//
//  GameScene.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    var slotMachine:SlotMachine?
    var slots:Slots?

    override func sceneDidLoad() {

        name = "GAME"
        backgroundColor = UIColor(red: 21/255, green: 13/255, blue: 80/255,alpha: 1)
        slotMachine=SlotMachine()
        slots = Slots()
        addChild(slotMachine!)
        addChild(slots!)

    }
    
    
    func touchDown(atPoint pos : CGPoint) {
     
    }
    
    func touchMoved(toPoint pos : CGPoint) {
      
    }
    
    func touchUp(atPoint pos : CGPoint) {
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
   
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
