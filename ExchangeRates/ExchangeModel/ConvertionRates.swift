//
//  ConvertionRates.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/20/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

// MARK: - ConversionRate
struct ConversionRate: Codable {
    let curID: Int
    let date: String
    let curAbbreviation: String
    let curScale: Int
    let curName: String
    let curOfficialRate: Double

    enum CodingKeys: String, CodingKey {
        case curID = "Cur_ID"
        case date = "Date"
        case curAbbreviation = "Cur_Abbreviation"
        case curScale = "Cur_Scale"
        case curName = "Cur_Name"
        case curOfficialRate = "Cur_OfficialRate"
    }
}

typealias ConversionRates = [ConversionRate]
