//
//  Pokemon.swift
//  PokeAPI
//
//  Created by Hina on 2024/03/25.
//

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}
