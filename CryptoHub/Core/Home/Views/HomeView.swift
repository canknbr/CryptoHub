//
//  HomeView.swift
//  CryptoHub
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    TopMoversView(viewModel: viewModel)
                    Divider()
                    AllCoinsView(viewModel: viewModel)
                }.navigationTitle("Live Prices")
                    .navigationBarTitleDisplayMode(.automatic)
                if viewModel.isLoadingData {
                    CustomLoadingIndicator()
                }
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
