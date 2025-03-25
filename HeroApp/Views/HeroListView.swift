//
//  HeroListView.swift
//  HeroApp
//
//  Created by Madina Abdulgafar on 20.03.2025.
//

import Foundation
import SwiftUI

struct HeroListView: View {
    @ObservedObject var viewModel = HeroListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.heroes) { hero in
                Text(hero.name)
            }
            .navigationTitle("SuperHeroes")
        }
        .onAppear {
            viewModel.fetchHeroes()
        }
    }
}

