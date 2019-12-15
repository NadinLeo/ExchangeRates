//
//  CurrencyList.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/22/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import SwiftUI

struct CurrencyListView: View {
    var currencyModelList: [CurrencyModel]
    var currencySelected: (CurrencyModel) -> Void
    
    var body: some View {
        NavigationView {
            List(currencyModelList) {
                currencyModel in
                CurrencyRowView(currencyModel: currencyModel).onTapGesture {
                    self.currencySelected(currencyModel)
                }
            }.listStyle(GroupedListStyle())
        }
        .navigationBarTitle("Rates")
    }
}

struct CurrencyList_Previews: PreviewProvider {
    static var previews: some View {
        CurrencyListView(currencyModelList: [CurrencyModel(id: 1,
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
                                                           curOfficialRate: 2.3)]){_ in
        }
    }
}
