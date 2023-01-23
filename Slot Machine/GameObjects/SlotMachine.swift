//
//  SlotMachine.swift
//  Slot Machine
//
//  Created by Jovi on 22/01/2023.
//

import GameplayKit
import SpriteKit


class SlotMachine:GameObject{
//    var slots:Slots?
    var balance:Int = 100000
    var betAmount:Int = 10
    var jackpot:Int = 200000
    var balanceNode:GameFontObject?
    var jackpotNode:GameFontObject?
    var betAmountNode:GameFontObject?

    init() {
        super.init(imageString: "slot-machine", initalScale: 0.75)
        
        zPosition = 10
        start()
        jackpotNode = GameFontObject(fontSize: 50)
        balanceNode = GameFontObject(fontSize: 40)
        betAmountNode = GameFontObject(fontSize: 40)
        
        //set labels value
        jackpotNode?.text = "$\(jackpot)"
        balanceNode?.text = "BAL: $\(balance)"
        betAmountNode?.text = "BET: $\(betAmount)"
        
        //add nodes to slot machine object
        addChild(jackpotNode!)
        addChild(balanceNode!)
        addChild(betAmountNode!)

        reset()
    }
    
    override func start() {
  
    }
    
    override func update() {
    
    }
    
    override func reset() {
        zPosition = 100
        //position labels on slot machine
        jackpotNode?.position.y = (jackpotNode!.position.y) + (texture!.size().height/2.0) - (texture!.size().height/4.2)
        
        balanceNode?.position.y = (balanceNode!.position.y) - (texture!.size().height/2.0) + (texture!.size().height/5.1)
        balanceNode?.position.x = position.x + (texture!.size().width)/4.2

        betAmountNode?.position.y = (betAmountNode!.position.y) - (texture!.size().height/2.0) + (texture!.size().height/5.1)
        betAmountNode?.position.x = ((frame.width/2) * -1)+frame.width*0.12
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
