//
//  PokedexView.swift
//  PokeAPI
//
//  Created by Hina on 2024/03/21.
//

import SwiftUI

struct PokedexView: View {
    private let gridItem = [GridItem(.flexible()), GridItem(.flexible())]
    //viewModelの参照し、Viewを描画
    //この人たちを監視している　観測
    @ObservedObject var viewModel = PokemonViewModel()
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItem, spacing: 20) {
                    //発行した配列が更新されるたび、全ての変更を読み込み
                    ForEach(viewModel.pokemon) { pokemon in
                        PokemonCell(pokemon: pokemon, viewModel: viewModel)
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
