//
//  PokemonViewModel.swift
//  PokeAPI
//
//  Created by Hina on 2024/03/25.
//

import SwiftUI
// 話し手
final class PokemonViewModel: ObservableObject {
    // オブジェクトが変更されるたびに
    // 発行が行われるたび通知を送り、ポケモン配列を使用してビューを再構成する
    @Published var pokemon: [Pokemon] = []
    let baseUrlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"

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

// MARK: - Private

extension PokemonViewModel {
    func fetchPokemon() async throws -> [Pokemon] {
        guard let url = URL(string: baseUrlString) else {
            throw APIClientError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let pokeData = data.parseData(removeString: "null,") else { throw APIClientError.noData }
        guard let httpStatus = response as? HTTPURLResponse else {
            throw APIClientError.responseError
        }
        switch httpStatus.statusCode {
        case 200 ..< 400:
            guard let responseData = try? JSONDecoder().decode([Pokemon].self, from: pokeData) else {
                throw APIClientError.decodeFailed
            }
            return responseData
        case 400...:
            throw APIClientError.badStatus(statusCode: httpStatus.statusCode)
        default:
            throw APIClientError.badStatus(statusCode: httpStatus.statusCode)
        }
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
