//
//  Notifications.swift
//  Slot Machine
//
//  Created by Jovi on 19/02/2023.
//

import Foundation

enum NotificationType{
    case showHelp, closeHelp
}

class Notifications{
    static let myNotification = Notification.Name("MyNotification")
    
    static func emit(value:NotificationType){
        let notification = Notification(name: myNotification, object: nil, userInfo: ["key": value])
        NotificationCenter.default.post(notification)
    }
}
