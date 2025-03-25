//
//  NetworkManager.swift
//  HeroApp
//
//  Created by Madina Abdulgafar on 20.03.2025.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchHeroes(completion: @escaping (Result<[Hero], Error>) -> Void) {
        let urlString = "https://akabab.github.io/superhero-api/api/all.json"
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }

            do {
                let heroes = try JSONDecoder().decode([Hero].self, from: data)
                completion(.success(heroes))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
