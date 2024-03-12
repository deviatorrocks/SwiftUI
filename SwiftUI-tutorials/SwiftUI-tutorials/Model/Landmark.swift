//
//  Landmark.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 05/03/24.
//

import Foundation
import SwiftUI
import MapKit

struct Landmark: Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    var isFeatured: Bool
    var featuredImage: Image? {
        return isFeatured ? Image("\(imageName)_feature") : nil
    }
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case rivers = "Rivers"
        case mountains = "Mountains"
        case lakes = "Lakes"
    }
    private var imageName: String
    var landmarkImage: Image {
        return Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(
                latitude: coordinates.latitude,
                longitude: coordinates.longitude)
    }
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
