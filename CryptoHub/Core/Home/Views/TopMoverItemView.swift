//
//  TopMoverItemView.swift
//  CryptoHub
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI
import Kingfisher

struct TopMoverItemView: View {
    let coin : Coin
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32,height: 32,alignment: .center)
                .foregroundColor(.orange)
                .padding(.bottom,8)
            HStack(spacing:2){
                Text("\(coin.symbol)".uppercased())
                    .foregroundColor(.theme.primaryTextColor)
                    .bold()
                Text(coin.currentPrice.toCurrency())
                    .foregroundColor(.gray)
            }
            .font(.caption)
            Text(coin.priceChangePercentage24H.toPercent())
                .font(.title2)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 140, height: 140, alignment: .center)
       
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color(.systemGray6),lineWidth: 2)
        )
    }
}
//
//struct TopMoverItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoverItemView()
//    }
//}
