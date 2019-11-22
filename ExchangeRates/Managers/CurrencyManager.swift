//
//  CurrencyManager.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/18/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

protocol CurrencyCreating {
    var currencyList: Dictionary<Int, String>{ get set }
    var currencyModelList: [CurrencyModel] { get }
    func getCurrencyList()
    func getConvertionRates()
}

extension Notification.Name {
    static let didReceiveData = Notification.Name("didReceiveData")
    static let didReceiveRates = Notification.Name("didReceiveRates")
    static let didCurrencyModelListCreated = Notification.Name("didCurrencyModelListCreated")
}

@objc
class CurrencyManager: NSObject, CurrencyCreating {
    var currencyModelList: [CurrencyModel] = []
    var currencyList: Dictionary<Int, String> = [:]
    let currencyDowloader = CurrencyDownloader()
    
    @objc open func onDidReceiveData(_ notification: Notification)
    {
        guard let currency = currencyDowloader.currency else { return }
        
        let currencyArray = currency.map{ ($0.curID, $0.curNameEng) }
        currencyList = Dictionary(uniqueKeysWithValues: currencyArray)
       
        print(currencyList)
    }
    
    @objc open func onDidReceiveRates(_ notification: Notification)
       {
        guard let convertionRates = currencyDowloader.conversionRates else { return }
           
        currencyModelList = convertionRates.map{ CurrencyModel(id: $0.curID, currencyId: $0.curID, currencyName: $0.curName, currencyCode: $0.curAbbreviation, curScale: $0.curScale, curOfficialRate: $0.curOfficialRate) }

           print(currencyModelList)
        NotificationCenter.default.post(name: .didCurrencyModelListCreated, object: self)
       }
    
    func getCurrencyList() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didReceiveData, object:nil)
        currencyDowloader.downloadCurency()
    }
    
    func getConvertionRates() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveRates(_:)), name: .didReceiveRates, object:nil)
        currencyDowloader.dowloadConvertionRates()
    }
}
