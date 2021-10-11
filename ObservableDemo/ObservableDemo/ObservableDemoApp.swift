//
//  ObservableDemoApp.swift
//  ObservableDemo
//
//  Created by SueJung Kim on 2021/10/10.
//

import SwiftUI

@main
struct ObservableDemoApp: App {
    let timerData = TimerData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(timerData)
        }
    }
}
