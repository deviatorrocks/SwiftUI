//
//  CategoryItem.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 06/03/24.
//

import SwiftUI

struct CategoryItem: View {
    var image: Image
    var name: String
    
    var body: some View {
        VStack(alignment: .leading) {
            image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 12)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(image: Image("turtlerock"), name: "Turtlerock")
    }
}
