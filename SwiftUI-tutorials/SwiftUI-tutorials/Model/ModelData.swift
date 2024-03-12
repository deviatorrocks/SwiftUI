//
//  ModelData.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 05/03/24.
//

import Foundation

class ModelData: ObservableObject {
    @Published var landmarks:[Landmark] = load(fileName: "landmarkData.json")
    var categoryList: [String: [Landmark]] {
        return Dictionary(grouping: landmarks, by: {$0.category.rawValue})
    }
    
    var featureList: [Landmark] {
        return landmarks.filter{ $0.isFeatured }
    }
}

func load<T: Decodable>(fileName: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
        fatalError("File not loaded")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("File nnot loaded")
    }
    
    do {
        let jsondeccoder = JSONDecoder()
        return try jsondeccoder.decode(T.self, from: data)
    } catch {
        fatalError("JSON decoder failed")
    }
}
