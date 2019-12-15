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
    private let mainCurrency: CurrencyModel = CurrencyModel(id: 1,
                                                            currencyId: 0,
                                                            currencyName: "Беларусь",
                                                            currencyCode: "BYN",
                                                            curScale: 1,
                                                            curOfficialRate: 1)
    
    var currencyModelList: [CurrencyModel] = []
    
    @Published var currencyFirst: CurrencyModel? {
        didSet {
            updateSecondInput()
        }
    }
    
    @Published var currencySecond: CurrencyModel? {
        didSet {
            updateFirstInput()
        }
    }
    
    @Published var firstInput: Double = 20 {
        didSet{
            updateSecondInput()
        }
    }
    
    @Published var secondInput: Double = 19 {
        didSet{
            updateFirstInput()
        }
    }
    
    func updateFirstInput() {
        let buCurrency = currencySecond?.convertTo(byCurrency: secondInput)
        let convertedValue = currencyFirst?.getValue(from: buCurrency ?? 0) ?? 0
        
        if (convertedValue != firstInput) {
            firstInput = convertedValue
        }
    }
    
    func updateSecondInput() {
        let buCurrency = currencyFirst?.convertTo(byCurrency: firstInput)
        let convertedValue = currencySecond?.getValue(from: buCurrency ?? 0) ?? 0
        
        if(convertedValue != secondInput) {
            secondInput = convertedValue
        }
    }
    
    init (curManager: CurrencyManagerProtocol,
          storageDataGetter: DataGetting) {
        self.curManager = curManager
        
        updateModel(currencyModelList: storageDataGetter.getCurrencyModels())
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onDidCurrencyModelListCreated(_:)),
            name: .didCurrencyModelListCreated,
            object:nil)
        curManager.downloadConvertionRates()
    }
    
    @objc public func onDidCurrencyModelListCreated(_ notification: Notification) {
        updateModel(currencyModelList: curManager.currencyModelList)
    }
    
    func updateModel(currencyModelList: CurrencyModels) {
        self.currencyModelList = [mainCurrency] + currencyModelList
        currencyFirst = self.currencyModelList[0]
        
        if (self.currencyModelList.count > 1) {
            currencySecond = self.currencyModelList[1]
        }
        else {
            currencySecond = self.currencyModelList[0]
        }
    }
}
