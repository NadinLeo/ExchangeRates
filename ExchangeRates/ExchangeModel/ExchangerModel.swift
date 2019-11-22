//
//  ExchangeData.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/21/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

final class ExchangerModel: ObservableObject {
    private let curManager: CurrencyManagerProtocol
    
    @Published var currencyFirst: CurrencyModel?
    @Published var currencySecond: CurrencyModel?
    @Published var firstInput: Double = 20 {
        didSet{
            print("Hello!!!")
        }
    }
    @Published var secondInput: Double = 19
    
    init (curManager: CurrencyManagerProtocol) {
        self.curManager = curManager
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onDidCurrencyModelListCreated(_:)),
            name: .didCurrencyModelListCreated,
            object:nil)
        curManager.downloadConvertionRates()
    }
    
    @objc public func onDidCurrencyModelListCreated(_ notification: Notification) {
        currencyFirst = curManager.currencyModelList[0]
        currencySecond = curManager.currencyModelList[1]
    }
}