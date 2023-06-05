//
//  TopMoversView.swift
//  CryptoHub
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI

struct TopMoversView: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Top Movers")
                .font(.headline)
            
            ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                HStack{
                    ForEach(0..<10) { _ in
                        TopMoverItemView()
                            
                    }
                }
            }
        }.padding(.horizontal,16)
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView()
    }
}
