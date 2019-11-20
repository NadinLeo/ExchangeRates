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
    func getCurrencyList()
}

extension Notification.Name {
    static let didReceiveData = Notification.Name("didReceiveData")
}

@objc
class CurrencyManager: NSObject, CurrencyCreating {
    var currencyList: Dictionary<Int, String> = [:]
    let currencyDowloader = CurrencyDownloader()
    
    @objc open func onDidReceiveData(_ notification: Notification)
    {
        guard let currency = currencyDowloader.currency else { return }
        
        let currencyArray = currency.map{ ($0.curID, $0.curNameEng) }
        currencyList = Dictionary(uniqueKeysWithValues: currencyArray)
       
        print(currencyList)
    }
    
    func getCurrencyList() {
        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didReceiveData, object:nil)
        currencyDowloader.downloadCurency()
    }
}
