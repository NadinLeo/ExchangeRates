//
//  CurrencyManager.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/18/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

@objc
class CurrencyManager: NSObject, CurrencyManagerProtocol {
    var currencyModelList: [CurrencyModel] = []
    var currencyList: Dictionary<Int, String> = [:]
    private let currencyDowloader = CurrencyDownloader()
    
    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onDidReceiveData(_:)),
            name: .didReceiveData,
            object: nil)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onDidReceiveRates(_:)),
            name: .didReceiveRates,
            object: nil)
    }
    
    @objc open func onDidReceiveData(_ notification: Notification) {
        guard let currency = currencyDowloader.currency else { return }
        
        let currencyArray = currency.map{ ($0.curID, $0.curNameEng) }
        currencyList = Dictionary(uniqueKeysWithValues: currencyArray)
        
        print(currencyList)
    }
    
    @objc open func onDidReceiveRates(_ notification: Notification) {
        guard let convertionRates = currencyDowloader.conversionRates else { return }
        
        currencyModelList = convertionRates.map { CurrencyModel(
            id: $0.curID,
            currencyId: $0.curID,
            currencyName: $0.curName,
            currencyCode: $0.curAbbreviation,
            curScale: $0.curScale,
            curOfficialRate: $0.curOfficialRate)
        }
        
        NotificationCenter.default.post(name: .didCurrencyModelListCreated, object: self)
    }
    
    func downloadCurrencyList() {
        currencyDowloader.downloadCurency()
    }
    
    func downloadConvertionRates() {
        currencyDowloader.dowloadConvertionRates()
    }
}
