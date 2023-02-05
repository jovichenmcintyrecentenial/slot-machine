//
//  SlotMachine.swift
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
//  Feburay 5, 2022

import GameplayKit
import SpriteKit


class SlotMachine:GameObject{
    var jackpot:Int = 5000
    var balanceNode:GameFontObject?
    var jackpotNode:GameFontObject?
    var betAmountNode:GameFontObject?
    var slots:Slots?
    var spinButton:SpinButton?
    var betUpButton:Button?
    var betDownButton:Button?
    var betMaxButton:Button?
    var resetButton:Button?

    
    var playerMoney = 1000
    var turn = 0
    var playerBet = 10
    var winRatio = 0
    var grapes = 0
    var melons = 0
    var oranges = 0
    var cherries = 0
    var strawberry = 0
    var bells = 0
    var sevens = 0
    var blanks = 0
    
    var betLine:[Slot] = [Slot.blank, Slot.blank, Slot.blank]
    var outCome = [0, 0, 0]
    
    /* Check to see if the player won the jackpot */
    func checkJackPot() {
        
        /* compare two random values */
        let jackPotTry = Int.random(in: 0..<51)
        let jackPotWin = Int.random(in: 0..<51)
        if (jackPotTry == jackPotWin) {
        
            showJackpotMessage()
            playerMoney += jackpot
            jackpot = 1000
        }
    }
    
    //update UI for labels and buttons state
    func updateUI(){
        //set labels value
        jackpotNode?.text = "$\(jackpot)"
        balanceNode?.text = "BAL: $\(playerMoney)"
        betAmountNode?.text = "BET: $\(playerBet)"
        
        updateSpinButtonUI()
        
    }
    
    
    //update spin button state base on playBet and playMoney amount
    func updateSpinButtonUI(){
        if(playerBet > playerMoney || playerMoney <= 0){
            spinButton?.setAsDisable()
        }
        else{
            spinButton?.setAsEnabled()
        }
    }

    init() {
        
        
        super.init(imageString: "slot-machine", initalScale: 0.75)
        
        zPosition = 10
        start()
        
        //create labels
        jackpotNode = GameFontObject(fontSize: 50)
        balanceNode = GameFontObject(fontSize: 40)
        betAmountNode = GameFontObject(fontSize: 40)
      
        updateUI()
        
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
    
    //function for trigger spinning of reels
    func spin(){
            resetMachine()
            reels()
            print(betLine)
        //disable button on spin
            spinButton?.setAsDisable()
            slots?.spin()
            slots?.stop(slots: betLine,onComplete: { [weak self] in
                if(self != nil){
                    self!.determineWinnings()
                    self!.updateUI()
                    self!.updateSpinButtonUI()
                    
                }
            })
        
      
    }
    
    func updateButtonPosition(){
        self.betUpButton?.position.y = -1*self.frame.height/2.4
        self.betDownButton?.position.y = -1*self.frame.height/2.4
        self.betMaxButton?.position.y = -1*self.frame.height/2.4
        self.resetButton?.position.y = -1*self.frame.height/2.4
        
        self.betDownButton?.position.x = -1*self.frame.width/7*1
        self.betUpButton?.position.x = -1*self.frame.width/5*2
        self.betMaxButton?.position.x = self.frame.width/7*1
        self.resetButton?.position.x = self.frame.width/5*2

    }
    
    override func reset() {
        zPosition = 100
        //position labels on slot machine
        jackpotNode?.position.y = (jackpotNode!.position.y) + (texture!.size().height/2.0) - (texture!.size().height/4.2)
        
        balanceNode?.position.y = (balanceNode!.position.y) - (texture!.size().height/2.0) + (texture!.size().height/5.1)
        balanceNode?.position.x = position.x + (texture!.size().width)/4.2

        betAmountNode?.position.y = (betAmountNode!.position.y) - (texture!.size().height/2.0) + (texture!.size().height/5.1)
        betAmountNode?.position.x = ((frame.width/2) * -1)+frame.width*0.20
        
    }
    

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /* Utility function to reset the player stats */
    func resetAll() {
        playerMoney = 1000
        jackpot = 5000
        turn = 0
        playerBet = 0
        winRatio = 0
        
        betLine = [Slot.blank, Slot.blank, Slot.blank]
        outCome = [0, 0, 0]
    }
    
    /* Utility function to reset all fruit tallies */
    func resetMachine() {
        

        
        grapes = 0
        melons = 0
        oranges = 0
        cherries = 0
        strawberry = 0
        bells = 0
        sevens = 0
        blanks = 0
        betLine = [Slot.blank, Slot.blank, Slot.blank]
        outCome = [0, 0, 0]

    }
    
    //do a restart on slot machince to initial state
    func restartGame(){
        playerBet = 10
        playerMoney = 1000
        jackpot = 5000
        resetMachine()
        slots?.adjustSlots(add: false)
        updateUI()
    }
    
    /* Utility function to check if a value falls within a range of bounds */
    func checkRange(_ value:Int, _ lowerBounds:Int,_ upperBounds:Int)->Int {
        if (value >= lowerBounds && value <= upperBounds)
        {
            return value
        }
        else {
            return -1
        }
    }
    
    /* This function calculates the player's winnings, if any */
    func determineWinnings()
    {
        var winnings = 0

        if (blanks == 0)
        {
            if (grapes == 3) {
                winnings = playerBet * 10
            }
            else if(melons == 3) {
                winnings = playerBet * 20
            }
            else if (oranges == 3) {
                winnings = playerBet * 30
            }
            else if (cherries == 3) {
                winnings = playerBet * 40
            }
            else if (strawberry == 3) {
                winnings = playerBet * 50
            }
            else if (bells == 3) {
                winnings = playerBet * 75
            }
            else if (sevens == 3) {
                winnings = playerBet * 100
            }
            else if (grapes == 2) {
                winnings = playerBet * 2
            }
            else if (melons == 2) {
                winnings = playerBet * 2
            }
            else if (oranges == 2) {
                winnings = playerBet * 3
            }
            else if (cherries == 2) {
                winnings = playerBet * 4
            }
            else if (strawberry == 2) {
                winnings = playerBet * 5
            }
            else if (bells == 2) {
                winnings = playerBet * 10
            }
            else if (sevens == 2) {
                winnings = playerBet * 20
            }
            else if (sevens == 1) {
                winnings = playerBet * 5
            }
            else {
                winnings = playerBet * 1
            }
            playerMoney += winnings
            checkJackPot()
        }
        else
        {
            playerMoney -= playerBet
            jackpot += 5
        }
        
        
    }
    
    /* When this function is called it determines the betLine results.
    e.g. Bar - Orange - Banana */
    func reels() {

        for spin in 0...2 {
            outCome[spin] = Int.random(in: 1..<65)
            switch (outCome[spin]) {
                case checkRange(outCome[spin], 1, 27):  // 41.5% probability
                    betLine[spin] = Slot.blank
                    blanks += 1
                    break
                case checkRange(outCome[spin], 28, 37): // 15.4% probability
                    betLine[spin] = Slot.grape
                    grapes += 1
                    break
                case checkRange(outCome[spin], 38, 46): // 13.8% probability
                betLine[spin] = Slot.melon
                    melons += 1
                    break
                case checkRange(outCome[spin], 47, 54): // 12.3% probability
                    betLine[spin] = Slot.orange
                    oranges += 1
                    break
                case checkRange(outCome[spin], 55, 59): //  7.7% probability
                    betLine[spin] = Slot.cherry
                    cherries += 1
                    break
                case checkRange(outCome[spin], 60, 62): //  4.6% probability
                    betLine[spin] = Slot.strawberry
                    strawberry += 1
                    break
                case checkRange(outCome[spin], 63, 64): //  3.1% probability
                    betLine[spin] = Slot.bell
                    bells += 1
                    break
                case checkRange(outCome[spin], 65, 65): //  1.5% probability
                    betLine[spin] = Slot.seven
                    sevens += 1
                    break
                default:
                    print()
            }
        }
    }
    
    //increase bet amount by 10 as long as play balance is suffient
    func betUp(){
        if(playerMoney >= playerBet+10){
            playerBet += 10
        }
        updateUI()
    }
    
    //reduce bet amount by 10 if
    func betDown(){
        //if player money some how got lower than bet then pressing this button
        //make bet amount equal to the player amount
        if(playerMoney < playerBet){
            playerBet = playerMoney
        }
        else if(playerBet > 10){
            playerBet -= 10
        }
        updateUI()

    }
    
    
    //bet all money that player has
    func betMax(){
        playerBet = playerMoney
        updateUI()

    }
    
    //message for when jackpot is won
    func showJackpotMessage(){
        let alert = UIAlertController(title: "🎉 Jackpot Winner 🎉", message: "Congratulation you won the Jackpot of $\(jackpot)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            // do something when OK is tapped
        }
        alert.addAction(okAction)

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)

    }
}
