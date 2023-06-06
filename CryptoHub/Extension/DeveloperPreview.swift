//
//  DeveloperPreview.swift
//  CryptoHub
//
//  Created by Can Kanbur on 6.06.2023.
//

import SwiftUI

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    let stat1 = StatisticModel(title: "CurrentPrice", value: "$21,543.00", percentageChange: 1.23)
    let stat2 = StatisticModel(title: "Market Capitalization", value: "$413.15Bn", percentageChange: 1.67)
    let stat3 = StatisticModel(title: "Rank", value: "1", percentageChange: nil)
    let stat4 = StatisticModel(title: "Volume", value: "35.99Bn", percentageChange: nil)

    let sectionModel = CoinDetailSectionModel(title: "Overview", stats: [StatisticModel(title: "CurrentPrice", value: "$21,543.00", percentageChange: 1.23)
                                                                         , StatisticModel(title: "Market Capitalization", value: "$413.15Bn", percentageChange: 1.67)
                                                                         , StatisticModel(title: "Rank", value: "1", percentageChange: nil)
                                                                         , StatisticModel(title: "Volume", value: "35.99Bn", percentageChange: nil),
        ])
}
