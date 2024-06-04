//
//  LuckymeApp.swift
//  Luckyme
//
//  Created by DaeunLee on 6/1/24.
//

import SwiftUI

@main
struct LuckymeApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            mainView(mind: .constant(""), desc: .constant(""))
        }
    }
}
