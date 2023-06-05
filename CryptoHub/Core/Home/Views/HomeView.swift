//
//  HomeView.swift
//  CryptoHub
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false) {
                TopMoversView()
                Divider()
                AllCoinsView()
            }.navigationTitle("Live Prices")
                .navigationBarTitleDisplayMode(.automatic)
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
