//
//  NotificationNameExtensions.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/22/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import Foundation

extension Notification.Name {
    static let didReceiveData = Notification.Name("didReceiveData")
    static let didReceiveRates = Notification.Name("didReceiveRates")
    static let didCurrencyModelListCreated = Notification.Name("didCurrencyModelListCreated")
}
