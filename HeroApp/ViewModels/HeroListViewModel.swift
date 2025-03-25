//
//  HeroListViewModel.swift
//  HeroApp
//
//  Created by Madina Abdulgafar on 20.03.2025.
//

import Foundation

class HeroListViewModel: ObservableObject {
    @Published var heroes: [Hero] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    func fetchHeroes() {
        isLoading = true
        NetworkManager.shared.fetchHeroes { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let heroes):
                    self.heroes = heroes
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
