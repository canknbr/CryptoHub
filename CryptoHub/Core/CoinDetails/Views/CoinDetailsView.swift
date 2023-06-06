//
//  CoinDetailsView.swift
//  CryptoHub
//
//  Created by Can Kanbur on 6.06.2023.
//

import SwiftUI

struct CoinDetailsView: View {
    let viewModel: CoinDetailsViewModel
    init(coin: Coin) {
        viewModel = CoinDetailsViewModel(coin: coin)
    }

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ChartView(viewModel: viewModel)
                .frame(height: 250)
                .padding(.vertical)
            CoinDetailsSection(model: viewModel.overviewSectionModel)
                .padding(.vertical)
            CoinDetailsSection(model: viewModel.additionalDetailsSectionModel)
                .padding(.vertical)
        }
        .padding()
        .navigationTitle(viewModel.coinName)
        .navigationBarTitleDisplayMode(.automatic)
    }
}

// struct CoinDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinDetailsView()
//    }
// }
