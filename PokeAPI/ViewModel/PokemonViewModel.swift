//
//  PokemonViewModel.swift
//  PokeAPI
//
//  Created by Hina on 2024/03/25.
//

import SwiftUI
//話し手
class PokemonViewModel: ObservableObject {
    //オブジェクトが変更されるたびに
    //発行が行われるたび通知を送り、ポケモン配列を使用してビューを再構成する
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    init() {
        fetchPokemon()
    }

    func fetchPokemon() {
        guard let url = URL(string: baseUrl) else { return }
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

    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemBlue
        case "electric": return .systemYellow
        case "psychic": return .systemPurple
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemTeal
        case "fairy": return .systemPink
        default: return .systemIndigo
        }
    }
    }

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}
