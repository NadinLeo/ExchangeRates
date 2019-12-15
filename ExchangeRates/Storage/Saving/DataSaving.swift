//
//  DataSavable.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 12/11/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

protocol DataSaving {
    func saveCurrencyModels(currencyModels: [CurrencyModel])
}
