//
//  Notifications.swift
//  Slot Machine
//
//  Created by Jovi on 19/02/2023.
//
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

enum NotificationType{
    case showHelp, closeHelp
}

class Notifications{
    static let myNotification = Notification.Name("MyNotification")
    
    //send notification value of type NotificationType
    static func emit(value:NotificationType){
        let notification = Notification(name: myNotification, object: nil, userInfo: ["key": value])
        NotificationCenter.default.post(notification)
    }
}
