//
//  Chart.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/8/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

// MARK: - ChartElement
struct ChartElement: Codable {
    let columns: [[Column]]
    let types, names, colors: Colors
}

// MARK: - Colors
struct Colors: Codable {
    let y0, y1: String
    let y2, y3, x: String?
}

enum Column: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Column.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Column"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

typealias Chart = [ChartElement]
