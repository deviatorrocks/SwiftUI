//
//  SwiftUI_tutorialsApp.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 05/03/24.
//

import SwiftUI

@main
struct SwiftUI_tutorialsApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
