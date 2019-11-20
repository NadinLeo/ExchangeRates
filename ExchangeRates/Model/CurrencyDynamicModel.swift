//
//  CurrencyDynamicModel.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/18/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

struct CurrencyDynamicModel: Equatable, Identifiable {
    var id: Int
    var currencyId: Int
    var currencyName: String
    var xTime = [String]()
    var isHidden: Bool = false
    var rate = [Double]()
}

typealias DynamicLines = [CurrencyDynamicModel]
