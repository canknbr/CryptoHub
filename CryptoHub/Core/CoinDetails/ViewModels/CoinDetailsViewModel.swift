//
//  CoinDetailsViewModel.swift
//  CryptoHub
//
//  Created by Can Kanbur on 6.06.2023.
//

import SwiftUI

class CoinDetailsViewModel {
    private let coin: Coin

    var chartData = [ChartData]()
    var startDate = Date()
    var endDate = Date()
    var minPrice = 0.0
    var maxPrice = 0.0
    var xAxisValues = [Date]()
    var yAxisValues = [Double]()
    
    var chartlineColor : Color {
        let priceChange = (coin.sparklineIn7D?.price.last ?? 0) - (coin.sparklineIn7D?.price.first ?? 0)
        return priceChange > 0 ? .green : .red
    }
    
    var coinName : String{
        return coin.name
    }

    var overviewSectionModel: CoinDetailSectionModel {
        let price = coin.currentPrice.toCurrency()
        let pricePercentChange = coin.priceChangePercentage24H
        let priceStat = StatisticModel(title: "CurrentPrice", value: price, percentageChange: pricePercentChange)

        let marketCap = coin.marketCap ?? 0
        let marketCapPercentChange = coin.marketCapChangePercentage24H
        let marketCapStat = StatisticModel(title: "Market Capitalization", value: marketCap.formatAbbr(), percentageChange: marketCapPercentChange)

        let rank = coin.marketCapRank
        let rankStat = StatisticModel(title: "Rank", value: "\(rank)", percentageChange: nil)

        let volume = coin.totalVolume ?? 0
        let volumeStat = StatisticModel(title: "Volume", value: volume.formatAbbr(), percentageChange: nil)

        return CoinDetailSectionModel(title: "Overview", stats: [priceStat, marketCapStat, rankStat, volumeStat])
    }

    var additionalDetailsSectionModel: CoinDetailSectionModel {
        let high = coin.high24H?.toCurrency() ?? "n/a"
        let highStat = StatisticModel(title: "24H High", value: high, percentageChange: nil)

        let low = coin.low24H?.toCurrency() ?? "n/a"
        let lowStat = StatisticModel(title: "24H Low", value: low, percentageChange: nil)

        let priceChange24 = coin.priceChange24H.toCurrency()
        let percentChange24H = coin.priceChangePercentage24H
        let priceChangeStat = StatisticModel(title: "24H Price Change", value: priceChange24, percentageChange: percentChange24H)

        let marketCapChange = coin.marketCapChange24H ?? 0
        let marketCapChangePercent = coin.marketCapChangePercentage24H
        let marketStat = StatisticModel(title: "24H Market Cap Change", value: "$\(marketCapChange.formatAbbr())", percentageChange: marketCapChangePercent)

        return CoinDetailSectionModel(title: "Additional Details", stats: [highStat, lowStat, priceChangeStat, marketStat])
    }

    init(coin: Coin) {
        self.coin = coin
        configureChartData()
    }

    func configureChartData() {
        guard let priceData = coin.sparklineIn7D?.price else { return }
        var index = 0
        minPrice = priceData.min()!
        maxPrice = priceData.max()!
        endDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        startDate = endDate.addingTimeInterval(-7 * 60 * 60 * 24)
        yAxisValues = [minPrice, (minPrice + maxPrice) / 2, maxPrice]
        xAxisValues = [startDate, endDate]
        for price in priceData.reversed() {
            let date = endDate.addingTimeInterval(-1 * 60 * 60 * Double(index))
            let chartDateItem = ChartData(date: date, value: price)
            chartData.append(chartDateItem)
            index += 1
        }
    }
}
