//
//  CryptoPassApp.swift
//  CryptoPass
//
//  Created by Kristina Mateva on 23.12.24.
//

import SwiftUI

@main
struct CryptoPassApp: App {
    #if os(iOS) || os(visionOS)
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    #elseif os(macOS)
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    #endif

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
