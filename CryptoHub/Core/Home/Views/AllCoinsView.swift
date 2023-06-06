//
//  AllCoinsView.swift
//  CryptoHub
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel : HomeViewModel
    var body: some View {
        VStack(alignment:.leading){
            Text("All Coins")
                .font(.headline)
                .padding()
            HStack{
                Text("Coin")
                Spacer()
                Text("Prices")
            }.font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal)
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    ForEach(viewModel.coins) { coin in
                        NavigationLink {
                            LazyNavigationView(CoinDetailsView(coin: coin))
                        } label: {
                            CoinRowView(coin: coin)
                        }

                    }
                }
            }
        }
    }
}

//struct AllCoinsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AllCoinsView()
//    }
//}
