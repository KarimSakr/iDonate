//
//  NotificationHandler.swift
//  iDonate
//
//  Created by i-magineworks on 24/04/2023.
//

import Foundation
import UserNotifications

class NotificationHandler:NSObject, UNUserNotificationCenterDelegate{
    
    //MARK: - Notification Scheduler
    private let scheduler = NotificationScheduler()
    
    
    //MARK: - Request notification authorization
    func requestNotificationAuthorization(completion: @escaping (Bool, Error?) -> Void){
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            completion(granted,error)
        }
    }
    
    //MARK: - Schedule a notification
    func scheduleDidYouKnowNotification(){
        scheduler.scheduleDidYouKnowNotification()
    }
    
    
    //MARK: - Delegate
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .list, .sound])
    }
    
    // make this file the delegate file for Notifications
    override init(){
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
}
