//
//  CoinDetailsSection.swift
//  CryptoHub
//
//  Created by Can Kanbur on 6.06.2023.
//

import SwiftUI

struct CoinDetailsSection: View {
    let model : CoinDetailSectionModel
    private let columns : [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        VStack{
            Text(model.title)
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity,alignment: .leading)
            LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                ForEach(model.stats) { stat in
                    StatisticView(model: stat)
                }
            }
        }
    }
}

struct CoinDetailsSection_Previews: PreviewProvider {
    static var previews: some View {
        CoinDetailsSection(model: dev.sectionModel)
    }
}
