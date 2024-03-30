//
//  PokemonCell.swift
//  PokeAPI
//
//  Created by Hina on 2024/03/21.
//

import SwiftUI
import Kingfisher

struct PokemonCell: View {
    let pokemon: Pokemon
    let backgroundColor: Color

    var body: some View {
        VStack {
            KFImage(URL(string: pokemon.imageUrl))
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(20)
                .padding(4)

            VStack {
                Text(pokemon.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(pokemon.type)
                    .font(.subheadline.bold())
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .overlay{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white.opacity(0.25))
                    }
            }
        }
        .padding(.bottom, 8)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(color: backgroundColor, radius: 6, x: 0.0, y: 0.0)
    }
}
