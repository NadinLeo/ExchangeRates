//
//  UserDefaultsDataGetting.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 12/11/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

class UserDefaultsDataGetting: DataGetting {
    func getCurrencyModels() -> CurrencyModels {
        let curencyModelsString = UserDefaults.standard.string(forKey: "currencyModels")
        
        guard let curencyModels = curencyModelsString else { return [] }
        
        let savedData = curencyModels.data(using: String.Encoding.utf8)
        guard let data = savedData else { return [] }
        
        do {
            let decoder = JSONDecoder()
            let currencyModels = try decoder.decode(CurrencyModels.self, from: data)
            print(currencyModels)
            return currencyModels
        }
        catch {
            print(error)
        }
        
        return []
    }
}
