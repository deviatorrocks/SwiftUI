//
//  FeatureCard.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 07/03/24.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    var body: some View {
        landmark.featuredImage?
            .resizable()
            .overlay(alignment: .bottomLeading, content: {
                TextOverlay(landmark: landmark)
            })
    }
}

struct TextOverlay: View {
    var landmark: Landmark
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                Text(landmark.park)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(landmark: ModelData().featureList[0])
    }
}


