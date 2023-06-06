//
//  HomeViewModel.swift
//  CryptoHub
//
//  Created by Can Kanbur on 6.06.2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    @Published var isLoadingData = true

    init() {
        fetchCoinData()
    }

    func fetchCoinData() {
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=true&price_change_percentage=24h&locale=en"

        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error : \(error.localizedDescription)")
                self.isLoadingData = false
                return
            }

            if let response = response as? HTTPURLResponse {
                print("\(response.statusCode)")
            }

            guard let data = data else { return }
            do {
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                DispatchQueue.main.async {
                    self.coins = coins
                    self.configureTopMovingCoins()
                    self.isLoadingData = false
                }
            } catch let error {
                print("\(error.localizedDescription)")
                self.isLoadingData = false
            }

        }.resume()
    }

    func configureTopMovingCoins() {
        let topMovers = coins.sorted(by: { $0.priceChangePercentage24H > $1.priceChangePercentage24H })
        topMovingCoins = Array(topMovers.prefix(5))
    }
}
