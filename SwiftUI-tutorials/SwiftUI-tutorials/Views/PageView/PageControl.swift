//
//  PageControl.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 07/03/24.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    
    typealias UIViewType = UIPageControl
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}
