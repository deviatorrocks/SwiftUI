//
//  CategoryRow.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 06/03/24.
//

import SwiftUI

struct CategoryRow: View {
    var name: String
    var list: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.headline)
                .padding(.leading, 12)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 4){
                    ForEach(list, id: \.id) { landmark in
                        NavigationLink {
                            LandmarkDetailView(landmark: landmark)
                        } label: {
                            CategoryItem(
                                image: landmark.landmarkImage,
                                name: landmark.name)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        let modelData = ModelData()
        CategoryRow(name: "Lakes", list: modelData.landmarks)
    }
}
