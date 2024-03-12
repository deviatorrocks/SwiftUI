//
//  PageViewController.swift
//  SwiftUI-tutorials
//
//  Created by Mandar on 07/03/24.
//

import SwiftUI
import UIKit

struct PageViewController<Page: View>: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIPageViewController
    var pages: [Page]
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        pageController.dataSource = context.coordinator
        pageController.delegate = context.coordinator
        return pageController
    }
    
    func updateUIViewController(_ uiViewController: UIPageViewController, context: Context) {
        uiViewController.setViewControllers([context.coordinator.controllers[currentPage]], direction: .forward, animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                return controllers.last
            }
            return controllers[index-1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            guard let index = controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == controllers.count {
                return controllers.first
            }
            return controllers[index + 1]
        }
        
        func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleController = pageViewController.viewControllers?.first,
               let index = controllers.firstIndex(of: visibleController) {
                parent.currentPage = index
            }
        }
        
        let parent: PageViewController
        var controllers = [UIViewController]()
        
        init(parent: PageViewController) {
            self.parent = parent
            self.controllers = parent.pages.map{ UIHostingController(rootView: $0) }
        }
    }
}
