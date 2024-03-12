//
//  LandmarkListView.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 05/03/24.
//

import SwiftUI

struct LandmarkListView: View {
    @EnvironmentObject var modelData: ModelData
    @State var showFavoriteOnly: Bool = true
    
    var filteredLandmarks: [Landmark] {
        return modelData.landmarks.filter{ landmark in
            (!showFavoriteOnly || landmark.isFavorite)
        }
    }

    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Show favorites only")
                }
                ForEach(filteredLandmarks, id: \.id) { landmark in
                    NavigationLink {
                        LandmarkDetailView(landmark: landmark)
                    } label: {
                        LandmarkRowView(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        } detail: {
            Text("selected detailed view")
        }
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView()
            .environmentObject(ModelData())
    }
}
