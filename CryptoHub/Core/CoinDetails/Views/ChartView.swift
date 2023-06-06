//
//  ChartView.swift
//  CryptoHub
//
//  Created by Can Kanbur on 6.06.2023.
//

import Charts
import SwiftUI

struct ChartView: View {
    let viewModel: CoinDetailsViewModel
    var body: some View {
        Chart {
            ForEach(viewModel.chartData) { item in
                LineMark(x: .value("Date", item.date), y: .value("Price", item.value))
                    .interpolationMethod(.cardinal)
                    .foregroundStyle(viewModel.chartlineColor)
            }
        }
        .chartXScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.startDate, upper: viewModel.endDate)))
        .chartXAxis {
            AxisMarks(position: .bottom, values: viewModel.xAxisValues) { value in
                AxisGridLine()
                AxisValueLabel {
                    if let dateVal = value.as(Date.self) {
                        Text(dateVal.asShortDateString())
                    }
                }
            }
        }
        .chartYScale(domain: ClosedRange(uncheckedBounds: (lower: viewModel.minPrice, upper: viewModel.maxPrice)))
        .chartYAxis {
            AxisMarks(position: .leading, values: viewModel.yAxisValues) { value in
                AxisGridLine()
                AxisValueLabel {
                    if let doubleVal = value.as(Double.self) {
                        Text(doubleVal.formatAbbr())
                    }
                }
            }
        }
    }
}
