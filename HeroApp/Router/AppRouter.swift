//
//  AppRouter.swift
//  HeroApp
//
//  Created by Madina Abdulgafar on 20.03.2025.
//

import Foundation
import UIKit
import SwiftUI

class AppRouter {
    static func createHeroListView() -> UINavigationController {
        let view = HeroListView()
        let navigationController = UINavigationController(rootViewController: UIHostingController(rootView: view))
        return navigationController
    }
}
