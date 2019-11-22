//
//  UserData.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/13/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var charts = ChartData.chartsData
    
    
    func chartIndex(chart: LinesSet) -> Int {
        return charts.firstIndex(where: {$0.id == chart.id}) ?? 0
    }
}

