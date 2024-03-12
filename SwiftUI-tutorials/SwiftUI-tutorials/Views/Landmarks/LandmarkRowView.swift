//
//  LandmarkRowView.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 05/03/24.
//

import SwiftUI

struct LandmarkRowView: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.landmarkImage
                .resizable()
                .frame(width: 40, height: 40)
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        
    }
}

//struct LandmarkRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        LandmarkRowView(landmark: Landmark(from: <#T##Decoder#>))
//    }
//}
