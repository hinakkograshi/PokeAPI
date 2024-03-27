//
//  PokedexView.swift
//  PokeAPI
//
//  Created by Hina on 2024/03/21.
//

import SwiftUI

struct PokedexView: View {
    private let gridItems: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]

    // viewModelを参照し、Viewを描画
    // この人たちを監視している　観測
    @ObservedObject var viewModel = PokemonViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 20) {
                    // 発行した配列が更新されるたび、全ての変更を読み込み
                    ForEach(viewModel.pokemon) { pokemon in
                        PokemonCell(
                            pokemon: pokemon,
                            backgroundColor: viewModel.backgroundColor(forType: pokemon.type)
                        )
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
