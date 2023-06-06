//
//  TopMoversView.swift
//  CryptoHub
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel : HomeViewModel
    var body: some View {
        VStack(alignment:.leading){
            Text("Top Movers")
                .font(.headline)
            
            ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(viewModel.topMovingCoins) { coin in
                        NavigationLink {
                            LazyNavigationView(CoinDetailsView(coin: coin))
                            
                        } label: {
                            TopMoverItemView(coin: coin)
                        }

                            
                    }
                }
            }
        }.padding(.horizontal,16)
    }
}
//
//struct TopMoversView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversView()
//    }
//}
