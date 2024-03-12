//
//  LandmarkDetailView.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 05/03/24.
//

import SwiftUI
import MapKit

struct LandmarkDetailView: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    var landmarkIdex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack(alignment: .center) {
            MapView(region: MKCoordinateRegion(
                center: landmark.locationCoordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)))
            
            CustomImageView(image: landmark.landmarkImage)
                .offset(y: -130)
                .padding(.bottom, -130)
                
            VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                            .foregroundColor(.primary)
                        FavouriteButton(isSet: $modelData.landmarks[landmarkIdex].isFavorite)
                    }
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                
                    Divider()
                    
                Text("About \(landmark.name)")
                        .font(.title2)
                Text(landmark.description)
                }
            }
            .padding([.leading, .trailing], 12)
            Spacer()
    }
}

//struct LandmarkDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        //LandmarkDetailView()
//    }
//}
