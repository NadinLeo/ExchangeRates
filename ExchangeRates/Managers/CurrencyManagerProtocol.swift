//
//  CurrencyManagerProtocol.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/22/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

protocol CurrencyManagerProtocol {
    var currencyList: Dictionary<Int, String>{ get }
    var currencyModelList: [CurrencyModel] { get }
    func downloadCurrencyList()
    func downloadConvertionRates()
}
