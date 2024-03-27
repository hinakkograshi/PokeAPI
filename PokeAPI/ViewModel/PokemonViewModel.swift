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
    @Published private(set) var pokemons: [Pokemon] = []

    private let baseUrlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"

    init() {
        fetchPokemons()
    }

    func backgroundColor(forType type: String) -> Color {
        switch type {
        case "fire": .red
        case "poison": .green
        case "water": .blue
        case "electric": .yellow
        case "psychic": .purple
        case "normal": .orange
        case "ground": .gray
        case "flying": .teal
        case "fairy": .pink
        default: .indigo
        }
    }
}

// MARK: - Privates

private extension PokemonViewModel {
    func fetchPokemons() {
        guard let url = URL(string: baseUrlString) else { return }
        let urlRequest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data?.parseData(removeString: "null,") else { return }
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }

            Task { @MainActor in
                self.pokemons = pokemon
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
