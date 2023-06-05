//
//  TopMoverItemView.swift
//  CryptoHub
//
//  Created by Can Kanbur on 5.06.2023.
//

import SwiftUI

struct TopMoverItemView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Image(systemName: "bitcoinsign.circle.fill")
                .resizable()
                .frame(width: 32,height: 32,alignment: .center)
                .foregroundColor(.orange)
                .padding(.bottom,8)
            HStack(spacing:2){
                Text("BTC")
                    .bold()
                Text("$20,300.00")
                    .foregroundColor(.gray)
            }
            .font(.caption)
            Text("+ 5.60%")
                .font(.title2)
                .foregroundColor(.green)
        }
        .frame(width: 140, height: 140, alignment: .center)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color(.systemGray6),lineWidth: 2)
        )
    }
}

struct TopMoverItemView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoverItemView()
    }
}
