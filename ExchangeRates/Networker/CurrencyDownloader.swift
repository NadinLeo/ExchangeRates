//
//  CurrencyDownloader.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/18/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

protocol CurrencyDownloadable {
    var currency: Currencies? { get }
    var conversionRates: ConversionRates? { get }
    func downloadCurency()
    func dowloadConvertionRates()
    
}

@objc
class CurrencyDownloader: NSObject, CurrencyDownloadable {
    var conversionRates: ConversionRates? {
        didSet {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .didReceiveRates, object: self)
                print(self.conversionRates)
            }
        }
    }
    
    var currency: Currencies? {
        didSet {
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .didReceiveData, object: self)
            }
        }
    }
    
    func downloadCurency() {
        Downloader.shared.getData(by: "https://www.nbrb.by/API/ExRates/Currencies", callback: getCurrencyDataModel)
    }
    
    private func getCurrencyDataModel(data:Data) {
        
        do {
            let decoder = JSONDecoder()
            self.currency = try decoder.decode(Currencies.self, from: data)
        }
        catch{
            print(error)
        }
    }
    
    func dowloadConvertionRates() {
           Downloader.shared.getData(by: "https://www.nbrb.by/api/exrates/rates?periodicity=0", callback: getConvertionRatesDataModel)
       }
    
    private func getConvertionRatesDataModel(data: Data) {
        do {
            let decoder = JSONDecoder()
            self.conversionRates = try decoder.decode(ConversionRates.self, from: data)
        }
        catch{
            print(error)
        }
    }
}
