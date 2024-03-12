//
//  ContentView.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 05/03/24.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State private var tabSelection: Tab = .featured
    
    enum Tab: String {
        case featured = "Featured"
        case list = "List"
    }
    var body: some View {
        TabView(selection: $tabSelection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
