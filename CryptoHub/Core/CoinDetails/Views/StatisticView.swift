//
//  StatisticView.swift
//  CryptoHub
//
//  Created by Can Kanbur on 6.06.2023.
//

import SwiftUI


struct StatisticView: View {
    let model : StatisticModel
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(model.title)
                .font(.caption)
            
            Text(model.value)
                .font(.headline)
            if let percentChange = model.percentageChange {
                HStack(spacing: 4) {
                    Image(systemName: "triangle.fill")
                        .font(.caption)
                        
                    Text(percentChange.toPercent() )
                        .font(.caption)
                        .bold()
                }
                .foregroundColor(.green)
            }
            }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView(model: dev.stat1)
    }
}
