//
//  ContentView.swift
//  ExchangeRates
//
//  Created by Nadzeya Leanovich on 11/8/19.
//  Copyright © 2019 Nadzeya Leanovich. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var exchangeData: ExchangerModel
    var body: some View {
        ExchangerView(model: self.exchangeData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ExchangerModel(curManager: CurrencyManagerStub(), storageDataGetter: UserDefaultsDataGetting()))
    }
}
