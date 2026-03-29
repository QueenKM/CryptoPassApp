//
//  AnalyticsService.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 24.12.24.
//


import FirebaseAnalytics

class AnalyticsService {
    func logEvent(_ eventName: String, parameters: [String: Any]? = nil) {
        Analytics.logEvent(eventName, parameters: parameters)
    }

    func logPasswordAdded() {
        logEvent("password_added", parameters: nil)
    }

    func logPasswordDeleted() {
        logEvent("password_deleted", parameters: nil)
    }
}
