//
//  CategoryHome.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 06/03/24.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(modelData.categoryList.keys.sorted(), id: \.self) { key in
                    CategoryRow(name: key, list: modelData.categoryList[key] ?? [])
                }
            }
            .navigationTitle("Featured list")
        } detail: {
            //LandmarkDetailView(landmark: <#T##Landmark#>)
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
