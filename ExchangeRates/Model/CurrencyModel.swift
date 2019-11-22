//
//  CurrencyModel.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/21/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

struct CurrencyModel: Equatable, Identifiable  {
    var id: Int
    var currencyId: Int
    var currencyName: String
    var currencyCode: String
    var curScale: Int
    var curOfficialRate: Double
    var xTime = [String]()
    var isHidden: Bool = false
    var rate = [Double]()
    
    func convertTo(byCurrency : Double) -> Double {
        return curOfficialRate * byCurrency / Double(curScale)
    }
    
    func getValue(from byCurrency: Double) -> Double {
        return byCurrency * Double(curScale) / curOfficialRate
    }
}
