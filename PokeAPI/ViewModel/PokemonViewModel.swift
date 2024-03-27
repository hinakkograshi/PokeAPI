//
//  PokemonViewModel.swift
//  PokeAPI
//
//  Created by Hina on 2024/03/25.
//

import SwiftUI

// 話し手
final class PokemonViewModel: ObservableObject {
    // オブジェクトが変更されるたびに通知を送り、ポケモン配列を使用してビューを再構成する
    @Published private(set) var pokemon: [Pokemon] = []

    private let baseUrlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"

    init() {
        fetchPokemon()
    }

    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": .systemRed
        case "poison": .systemGreen
        case "water": .systemBlue
        case "electric": .systemYellow
        case "psychic": .systemPurple
        case "normal": .systemOrange
        case "ground": .systemGray
        case "flying": .systemTeal
        case "fairy": .systemPink
        default: .systemIndigo
        }
    }
}

// MARK: - Privates

private extension PokemonViewModel {
    func fetchPokemon() {
        guard let url = URL(string: baseUrlString) else { return }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }
        task.resume()
    }
}

private extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
