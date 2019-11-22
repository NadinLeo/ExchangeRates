//
//  CurrencyManagerStub.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/22/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

class CurrencyManagerStub: CurrencyManagerProtocol {
    var currencyModelList: [CurrencyModel] = [
        CurrencyModel(id: 1,
                      currencyId: 1,
                      currencyName: "Belarus",
                      currencyCode: "BYN",
                      curScale: 1,
                      curOfficialRate: 1),
        CurrencyModel(id: 2,
                      currencyId: 2,
                      currencyName: "USA",
                      currencyCode: "USD",
                      curScale: 1,
                      curOfficialRate: 1)
    ]
    var currencyList: Dictionary<Int, String> = [:]
    
    init() {
    }
    
    func downloadCurrencyList() {
        
    }
    
    func downloadConvertionRates() {
        NotificationCenter.default.post(name: .didCurrencyModelListCreated, object: self)
    }
}
