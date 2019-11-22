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
    var curencuModelList: [CurrencyModel] = []
    @Published var currencyFirst: CurrencyModel?
    @Published var currencySecond: CurrencyModel?
    @Published var firstInput: Double = 20 {
        didSet{
            let buCurrency = currencyFirst?.convertTo(byCurrency: firstInput)
            let convertedValue = currencySecond?.getValue(from: buCurrency ?? 0) ?? 0
            
            if(convertedValue != secondInput) {
                secondInput = convertedValue
            }
        }
    }
    
    @Published var secondInput: Double = 19 {
        didSet{
            let buCurrency = currencySecond?.convertTo(byCurrency: secondInput)
            let convertedValue = currencyFirst?.getValue(from: buCurrency ?? 0) ?? 0
            
            if (convertedValue != firstInput) {
                firstInput = convertedValue
            }
        }
    }
    
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
        curencuModelList = curManager.currencyModelList
        currencyFirst = curManager.currencyModelList[0]
        currencySecond = curManager.currencyModelList[1]
    }
}
