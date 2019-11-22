//
//  CurrencyList.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/22/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import SwiftUI

struct CurrencyListView: View {
    var currencyList: [CurrencyModel]
    var body: some View {
        NavigationView {
            List(currencyList) {
                currencyModel in
                CurrencyRowView(currencyModel: currencyModel)
            }
        }
        .navigationBarTitle("Rates")
    }
}

struct CurrencyList_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListView(currencyList: [CurrencyModel(id: 1,
                                                  currencyId: 1,
                                                  currencyName: "RUB",
                                                  currencyCode: "RUB",
                                                  curScale: 100,
                                                  curOfficialRate: 18),
                                    CurrencyModel(id: 2,
                                                  currencyId: 2,
                                                  currencyName: "USA",
                                                  currencyCode: "USD",
                                                  curScale: 1,
                                                  curOfficialRate: 2.3)])
    }
}
