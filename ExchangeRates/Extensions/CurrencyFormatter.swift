//
//  NumberFormatter.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/22/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation


struct CurrencyFormatter {
    static var formatter: NumberFormatter = {
        var formatter =  NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencySymbol = ""
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        return formatter
    }()
    
    static func format(value: Double) -> String? {
        var res = String(format: "%.2f", arguments: [value])
        if res.hasSuffix(".00") {
            res.removeLast(3)
        }
        return res
        //return formatter.string(from: NSNumber(value: value))
    }
}
