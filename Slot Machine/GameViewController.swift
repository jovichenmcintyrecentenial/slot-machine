//
//  GameViewController.swift
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

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register obeserver for notifictions
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: Notifications.myNotification, object: nil)

        if let scene = GKScene(fileNamed: "GameScene") {
            
            if let sceneNode = scene.rootNode as! GameScene? {
                
                sceneNode.scaleMode = .aspectFill
                
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    view.ignoresSiblingOrder = true
                }
            }
        }
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .portrait
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // remove all observers
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //handle notification send by app to control UI element in gameview controller
    @objc func handleNotification(_ notification: Notification) {
        // Handle the notification
        if let userInfo = notification.userInfo {
            let type = userInfo["key"] as? NotificationType
            
            if(type == .showHelp){
                contentView.isHidden = false
            }
            else if(type == .closeHelp){
                contentView.isHidden = true
            }
        }
    }

}


