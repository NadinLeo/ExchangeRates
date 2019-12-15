//
//  UserDefaultsDataSaving.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 12/11/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

class UserDefaultsDataSaving: DataSaving {
    func saveCurrencyModels(currencyModels: [CurrencyModel]) {
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(currencyModels)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            UserDefaults.standard.set(json, forKey: "currencyModels")
        }
        catch {
            print(error)
        }
    }
}
