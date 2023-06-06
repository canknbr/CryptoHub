//
//  StatisticModel.swift
//  CryptoHub
//
//  Created by Can Kanbur on 6.06.2023.
//

import Foundation

struct StatisticModel : Identifiable {
    let id = UUID().uuidString
    let title : String
    let value : String
    let percentageChange : Double?
}
