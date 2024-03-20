//
//  PokemonCell.swift
//  PokeAPI
//
//  Created by Hina on 2024/03/21.
//

import SwiftUI

struct PokemonCell: View {
    var body: some View {
        ZStack {
            VStack {
                Image("1")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.all, 20)
                //こういう書き方もできる
                    .padding([.bottom, .trailing, .top, .leading], 4)

                VStack {
                    Text("Blubasaur")
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("position")
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white.opacity(0.25))
                            )
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 24)
                        .padding(.bottom, 8)

                }
            }
        }
        .background(.green)
        .cornerRadius(12)
        .shadow(color: .green, radius: 6, x: 0.0, y: 0.0)
    }
}

#Preview {
    PokemonCell()
}
