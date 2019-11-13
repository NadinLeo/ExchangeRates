//
//  LineSetModel.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/8/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import UIKit

struct LinesSet: Equatable, Identifiable {
    var id: Int
    var namex = ""
    var xTime = [String]()
    var colorX: UIColor?
    var lines = [Line]()
    var lowerBound: CGFloat = 0.3
    var upperBound: CGFloat = 0.7
}


struct Line: Equatable, Identifiable {
    var id: Int
    var title: String
    var points = [Int]()
    var color: UIColor?
    var isHidden: Bool = false
    var type: String
    var countY: Int
}

typealias Lines = [LinesSet]
