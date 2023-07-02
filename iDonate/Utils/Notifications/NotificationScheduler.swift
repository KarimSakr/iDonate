//
//  NotificationScheduler.swift
//  iDonate
//
//  Created by i-magineworks on 24/04/2023.
//

import Foundation
import UserNotifications

class NotificationScheduler{
    func scheduleDidYouKnowNotification(){
        
        // Loops through the didYouKnow array and schedules a notification for each one
        for (index, didYouKnowString) in DidYouKnowData().didYouKnow().enumerated() {
            // content
            let content = UNMutableNotificationContent()
            content.title = Constants.Notification.Title.didYouKnow
            content.body = didYouKnowString
            
            //triggers a notification each 3 days
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval((60*60*24*3) * (index + 1)), repeats: false)
                
            //request
            let request = UNNotificationRequest(identifier: Constants.Notification.Name.notificationName + "\(index)", content: content, trigger: trigger)
            
            let notificationCenter = UNUserNotificationCenter.current()
            notificationCenter.add(request)
        }
    }
}
