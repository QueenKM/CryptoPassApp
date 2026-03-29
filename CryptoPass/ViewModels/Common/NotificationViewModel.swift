//
//  NotificationViewModel.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import Foundation

class NotificationViewModel: ObservableObject {
    private let notificationService = NotificationService()

    func requestPermission() {
        notificationService.requestAuthorization()
    }

    func scheduleReminder(for title: String, body: String, after timeInterval: TimeInterval) {
        notificationService.scheduleNotification(title: title, body: body, timeInterval: timeInterval)
    }
}
