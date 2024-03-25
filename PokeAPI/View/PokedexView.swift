//
//  PokedexView.swift
//  PokeAPI
//
//  Created by Hina on 2024/03/21.
//

import SwiftUI

struct PokedexView: View {
    private let gridItem = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItem, spacing: 20) {
                    ForEach(0..<151) { _ in
                        PokemonCell(pokemon: MOCK_POKEMON[3])
                    }
                }
            }
            .navigationTitle("Pokedex")
        }
    }
}

#Preview {
    PokedexView()
}
