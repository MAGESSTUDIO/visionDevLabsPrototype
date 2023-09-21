//
//  MagesVisionApp.swift
//  MagesVision
//
//  Created by Atul Singh on 30/08/23.
//

import SwiftUI

@main
struct MagesVisionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }
    }
}
