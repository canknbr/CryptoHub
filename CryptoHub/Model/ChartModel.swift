//
//  ChartModel.swift
//  CryptoHub
//
//  Created by Can Kanbur on 6.06.2023.
//

import Foundation
struct ChartData : Identifiable {
    let id = UUID().uuidString
    let date : Date
    let value : Double
}
