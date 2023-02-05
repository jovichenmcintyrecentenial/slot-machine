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


    override func sceneDidLoad() {

        name = "GAME"
        backgroundColor = UIColor(red: 21/255, green: 13/255, blue: 80/255,alpha: 1)
        slotMachine=SlotMachine()
        
        slotMachine?.slots = Slots()
        slotMachine?.spinButton = SpinButton(frame)
        
        slotMachine?.betUpButton = Button(frame)
        slotMachine?.betDownButton = Button(frame)
        slotMachine?.betMaxButton = Button(frame)
        slotMachine?.resetButton = Button(frame)
        


        addChild(slotMachine!)
        addChild((slotMachine?.slots!)!)
        addChild(slotMachine!.spinButton!)
        
        addChild(slotMachine!.betUpButton!)
        addChild(slotMachine!.betDownButton!)
        addChild(slotMachine!.betMaxButton!)
        addChild(slotMachine!.resetButton!)
        
        slotMachine?.updateButtonPosition()


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
        if let touch = touches.first {
            let location = touch.location(in: self)
            let node = self.nodes(at: location).first
            if node == slotMachine!.spinButton && slotMachine!.spinButton!.isEnabled {
                // Perform your action
                slotMachine?.spin()
            }
            if node == slotMachine!.betUpButton && !slotMachine!.slots!.isSpinning {
                // Perform your action
                slotMachine?.betUp()
            }
            if node == slotMachine!.betDownButton && !slotMachine!.slots!.isSpinning  {
                // Perform your action
                slotMachine?.betDown()
            }
            if node == slotMachine!.betMaxButton && !slotMachine!.slots!.isSpinning  {
                // Perform your action
                slotMachine?.betMax()
            }
            if node == slotMachine!.resetButton && !slotMachine!.slots!.isSpinning  {
                // Perform your action
                slotMachine?.restartGame()
            }
        }
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        slotMachine?.slots?.update()
    }
}
